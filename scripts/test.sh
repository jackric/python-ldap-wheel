#!/bin/bash
# Goal: install python-ldap wheel without having dev libs

set -e
set -x

export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.8/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/python@3.8/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/python@3.8/include"

python3.8 -m pip install virtualenv
virtualenv /tmp/venv

source /tmp/venv/bin/activate
pip install /dist/python_ldap-3.3.0-cp38-cp38-linux_x86_64.whl

python -c "import ldap; print(ldap.__version__)"
