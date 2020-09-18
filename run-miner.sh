#!/bin/bash

# FIXME use miner-updater script instead!
./update-miner.sh
exit


# Old, basic script
version="2020.09.15.0_GA"

docker rm -f miner

docker run -d \
	--env REGION_OVERRIDE=US915 \
	--restart always \
	--publish 1680:1680/udp \
	--publish 44158:44158/tcp \
	--name miner \
	--mount type=bind,source=$HOME/miner-data,target=/var/data \
	"quay.io/team-helium/miner:miner-arm64_$version"

