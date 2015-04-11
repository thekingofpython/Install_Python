#!/bin/sh

set -xe 

# Install Dependencies.
sudo apt-get -yqq update && sudo apt-get -yqq install \
 build-essential \
 libreadline-gplv2-dev \
 libncursesw5-dev \
 libssl-dev \
 libsqlite3-dev \
 tk-dev libgdbm-dev \
 libc6-dev libbz2-dev

# Install python 2.7.9 and 3.4.3
for PYTHON_VER in 2.7.9 3.4.3; do
	PYTHON="Python-$PYTHON_VER"
	wget https://www.python.org/ftp/python/$PYTHON_VER/Python-$PYTHON_VER.tar.xz
	tar -xf $PYTHON.tar.xz && rm -rf $PYTHON.tar.xz
	cd $PYTHON
	./configure && make && make install
	rm -rf $PYTHON
	if [ $PYTHON_VER = "2.7.9" ]; then
		python -m ensurepip
		python -m ensurepip --upgrade
	else 
		python3 -m ensurepip
		python3 -m ensurepip --upgrade
	fi
done
