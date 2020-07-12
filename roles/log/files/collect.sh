#!/usr/bin/env bash

host=$1
name=$2
log_dir=$3

rm -rf $log_dir

mkdir -p ${log_dir}

container_ids=`docker ps -aqf "name=${name}"`

for id in $container_ids
do
    echo $id
    docker logs $id > ${log_dir}/${host}_${id}.log
done
