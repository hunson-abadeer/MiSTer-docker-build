#!/bin/bash

# script to compile MiSTer cores using Quartus Lite 17.0.2 in a linux environment.

script_path="${0}"
usage="This script uses Docker environment mister-quartus for compiling de10nano FPGA cores."
example_usage_01="Example usage:"
example_usage_02="git clone https://github.com/MiSTer-devel/MegaCD_MiSTer"
example_usage_03="cd MegaCD_MiSTer"
example_usage_04="${script_path} MegaCD"
if [ $# -eq 0 ]
  then
    echo ""
    echo ${usage}
    echo ${example_usage_01}
    echo "  " ${example_usage_02}
    echo "  " ${example_usage_03}
    echo "  " ${example_usage_04}
    echo ""
    exit 0
fi

docker run --rm -it -v $(pwd):/build mister-quartus:latest /usr/local/bin/quartus_wrapper quartus_sh --flow compile "$@"

