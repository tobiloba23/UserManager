#!/bin/sh

homebrew=`brew -v`

node=`node -v`
if [ -z "$node" ]; then 
    if [ -n "$homebrew" ]; then
        brew install node
    else
        echo "Kindly install homebrew to proceed"
        exit
    fi
fi

docker=`docker -v`
if [ -z "$docker" ]; then 
    if [ -n "$homebrew" ]; then
        brew cask install docker
    else
        echo "Kindly install homebrew to proceed"
        exit
    fi
fi

open -a docker

mongodb=`mongo --version`
if [ -z "$mongodb" ]; then 
    if [ -z "$homebrew" ]; then
        brew install mongodb
    else
        echo "Kindly install homebrew to proceed"
    fi
fi

dockerI=`docker info`
while [ -z "$dockerI" ]
do
    dockerI=`docker info`
done

jasmine=`jasmine -v`
if [ -z "$jasmine" ]; then 
npm i -g jasmine
fi

cd "$(dirname "$0")"

docker-compose build
