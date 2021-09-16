#!/bin/bash

sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL get.docker.com -o get.docker.sh

sudo sh get.docker.sh

docker -v
