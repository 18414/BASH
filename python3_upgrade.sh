#!/bin/bash

yum update -y
yum install -y vim ftp wget tar
yum groupinstall -y "Development Tools"
wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
tar -xJf Python-3.6.4.tar.xz
cd Python-3.6.4
./configure
make
make install
echo -e "`tput setaf 3`Python3 upgraded successfully`tput sgr0`"

#`python -V`

echo -e "`tput bold`This is a default path of python`tput sgr0`"
type -a python

echo -e "`tput setaf 1 ` Setting up default python version"
update-alternatives  --set python /usr/local/bin/python3.6



