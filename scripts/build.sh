#!/bin/bash
# Build a wheel for python-ldap


set -e
set -x

export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.8/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/python@3.8/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/python@3.8/include"

python3.8 -m pip install virtualenv
virtualenv /tmp/venv

source /tmp/venv/bin/activate


cd /tmp
git clone https://github.com/python-ldap/python-ldap
cd python-ldap
python setup.py bdist_wheel
cp dist/*.whl /dist

