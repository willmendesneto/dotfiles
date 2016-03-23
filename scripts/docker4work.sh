#!/usr/bin/env bash

[ -z "$WORK" ] && exit

docker rm -f $(docker ps -a -q)
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")

docker run --restart always --name postgres -e POSTGRES_USER=willmendesneto -d -p 5432:5432 postgres
VBoxManage controlvm "default" natpf1 "tcp-port5432,tcp,,5432,,5432";

docker run --restart always --name mongo -d -p 27017:27017 mongo
VBoxManage controlvm "default" natpf1 "tcp-port27017,tcp,,27017,,27017";

docker run --restart always --name eventstore -d -p 2113:2113 -p 1113:1113 adbrowne/eventstore
VBoxManage controlvm "default" natpf1 "tcp-port2113,tcp,,2113,,2113";
VBoxManage controlvm "default" natpf1 "tcp-port1113,tcp,,1113,,1113";
