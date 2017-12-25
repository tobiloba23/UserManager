#!/bin/sh

node=`node -v`
if [ -z "$node" ]; then 
brew install node
fi

mongodb=`mongo --version`
if [ -z "$mongodb" ]; then 
brew install mongodb
fi

docker=`docker -v`
if [ -z "$docker" ]; then 
brew cask install docker
fi

jasmine=`jasmine -v`
if [ -z "$jasmine" ]; then 
npm i -g jasmine
fi

cd "$(dirname "$0")"

docker-compose build
