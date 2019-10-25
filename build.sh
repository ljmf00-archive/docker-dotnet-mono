#!/usr/bin/env bash

VERSION=$(cat .version 2>/dev/null || echo dev)

if [ "$1" == "runtime" ];
then
	DOCKER_ARGS="--build-arg base_image=mcr.microsoft.com/dotnet/core/sdk:2.2-alpine3.9 --build-arg add_packages=make"
elif [ "$1" != "build" ];
then
	echo "Invalid type! use 'runtime' or 'build'" 2>&1
	exit 1
fi

docker build --no-cache -t "codacy/docker-dotnet-mono-$1:$VERSION" $DOCKER_ARGS .
