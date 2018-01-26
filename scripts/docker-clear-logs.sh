#! /usr/bin/bash
cp /dev/null "$(docker inspect -f '{{.LogPath}}' $1)"
