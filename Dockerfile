FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y build-essential procps curl file git

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
