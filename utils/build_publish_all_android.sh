#!/usr/bin/env bash

MASON_NAME=$1 ; shift
MASON_VERSION=$1 ; shift

set -e
set -o pipefail

export MASON_PLATFORM=android

arch=( arm-v5 arm-v7 arm-v8 x86 x86-64 mips mips-64 )
for i in "${arch[@]}"
do
   :
    export MASON_ANDROID_ABI=${i}
    mason build ${MASON_NAME} ${MASON_VERSION}
    mason publish ${MASON_NAME} ${MASON_VERSION}
done