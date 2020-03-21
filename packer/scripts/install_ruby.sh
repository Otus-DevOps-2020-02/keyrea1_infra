#!/bin/bash
set -e

echo Installing Ruby

apt update
apt install -y ruby-full ruby-bundler build-essential
