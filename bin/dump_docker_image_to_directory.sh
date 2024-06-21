#!/usr/bin/env bash

set -e

IMAGE=$1
DIR=$2
TAR=${DIR}.tar

ID=$(docker create ${IMAGE})
docker export ${ID} -o ${TAR}
docker rm ${ID}
mkdir ${DIR}
mv ${TAR} ${DIR}
cd ${DIR}
tar -xvf ${TAR}
