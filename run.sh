#!/bin/bash

sudo docker run --restart=always -d -h VEGETA --name transmission \
	-v /poolmirror1/:/poolmirror1/ -v /docker-data/transmission/:/var/lib/transmission-daemon/ \
	-p 9091:9091 -p 51413:51413 \
	transmission
