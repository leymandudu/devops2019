#!/bin/bash

# Description: The script is used to find files in the /var/log older than 14 days and delete them.
# Author: Adeleye Adewuyi
# Email: leymandudu@gmail.com
# Date: 10/27/2022

find /var/log -mtime +14 -type f -delete
exit 0

