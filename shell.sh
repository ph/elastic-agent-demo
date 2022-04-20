#!/usr/bin/env bash
set -eo pipefail
apt-get update
apt-get install -y nginx
chown -R vagrant:vagrant /home/vagrant/downloads
