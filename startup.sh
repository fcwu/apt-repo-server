#!/bin/bash

mkdir -p /data/dists/trusty/main/binary-amd64/
exec /usr/bin/supervisord -n
