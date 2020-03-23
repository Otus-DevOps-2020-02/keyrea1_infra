#!/bin/bash
set -e

echo Installing reddit monolith
echo 1
pwd
git clone -b monolith https://github.com/express42/reddit.git
echo 2
cd reddit/
echo 3
bundle install
echo 4
mv /home/appuser/puma.service /etc/systemd/system/puma.service
echo 5
systemctl enable puma.service
echo 6
systemctl start puma.service
