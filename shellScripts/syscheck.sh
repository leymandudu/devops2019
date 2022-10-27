#!/bin/bash

# Description: The script is used to check new install server configurations.
# Author: Adeleye Adewuyi
# Email: leymandudu@gmail.com
# Date: 10/27/2022

## Checking CPU
CPU_N = `nproc`
if [ ${CPU_N} -lt 2 ]
then
echo "CPU check failed"
else
echo "CPU check passed"
fi

## Checking the total memory
MEM = `free -m | grep Mem | awk '{print $2}'`
if [ ${MEM} -lt 2000 ]
then
echo "Memory check failed"
else
echo "Memory check passed"
fi

## Check files if exist
if [ -f /etc/group ]
then
echo "File /etc/group passed"
else
echo "File /etc/group failed"
fi

if [ -f /etc/passwd ]
then
echo "File /etc/passwd passed"
else
echo "File /etc/passwd failed"
fi

if [ -f /etc/httpd ]
then
echo "File /etc/httpd passed"
else
echo "File /etc/httpd failed"
fi

if [ -f /etc/kubernetes ]
then
echo "File /etc/kubernetes passed"
else
echo "File /etc/kubernetes failed"
fi

## Checking if a user exist
id puppet
RC = $?
if [ ${RC} -eq 0 ]
then
echo "User puppet check passed"
else
echo "User puppet check failed"
fi

## Check the first digit of kernel version
kernelVersion = `uname -r | awk -F "." '{print $1}'`
if [ ${kernelVersion} -ge 3 ]
then
echo "Kernel version check passed"
else
echo "Kernel version check failed"
fi