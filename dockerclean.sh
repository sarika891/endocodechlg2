#!/bin/bash
docker stop $1 2> /dev/null || true && docker rm $1 2> /dev/null || true
echo "docker stopped and removed successfully"
