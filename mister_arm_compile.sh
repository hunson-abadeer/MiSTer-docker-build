#!/bin/bash

# script to compile source using Arm linux environment compatible with MiSTer

script_path="${0}"
usage="This script uses a Docker image to facilitate cross compiling ARM Mister binaries."
example_usage_01="Example usage:"
example_usage_02="git clone https://github.com/MiSTer-devel/Main_MiSTer"
example_usage_03="cd Main_MiSTer"
example_usage_04="${script_path} make"
if [ $# -eq 0 ]
  then
    echo ""
    echo ${usage}
    echo ${example_usage_01}
    echo "  " ${example_usage_02}
    echo "  " ${example_usage_03}
    echo "  " ${example_usage_04}
    exit 0
fi

arm_build_script=dockcross-linux-armv7.sh
arm_build_script_path="$(dirname ${script_path})/${arm_build_script}"

if [ ! -f ${arm_build_script_path} ]
then
    docker run --rm dockcross/linux-armv7 > ${arm_build_script_path}
    if [ ! -f ${arm_build_script_path} ]
    then
        echo "Failed to install ARM docker image, please verify Docker is installed and running"
        exit 1
    fi
    chmod +x ${arm_build_script_path}
fi

${arm_build_script_path} "$@" BASE=armv7-unknown-linux-gnueabi
