#!/bin/sh
docker exec miner tail -f -n0 /var/log/miner/console.log /var/log/miner/error.log /var/log/miner/crash.log
