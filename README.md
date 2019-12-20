# MiSTer-docker-build
Docker image and utility shell scripts for compiling FPGA cores and C binaries for the MiSTer FPGA project.


The goal of this repo is to be a turn-key solution for building MiSTer cores and MiSTer C/C++ binaries.
The scripts have been developed and tested on MacOS.  It should be possible to use the Docker image on Windows or Linux, but this has not been tested.  The convenience scripts `mister_quartus_compile.sh` and `mister_arm_compile.sh` are written in BASH and assume a Unix environment.

## Software Requirements
* git command line
* docker command line

## Docker Hardware Allocation Requirements
* Docker Images require around 24GB of Docker allocated storage
* Compiling RBF core files uses as much as 7GB of Docker allocated memory

Command line git and Docker must be installed and properly configured.
### MacOS users
Using homebrew to install git and Docker is recommended but not required.

## Usage
This repo contains two scripts `mister_quartus_compile.sh` and `mister_arm_compile.sh`
* `mister_quartus_compile.sh` for compiling FPGA cores
* `mister_arm_compile.sh` for compiling ARM compatible C binaries 

### Clone the repo
```
git clone https://github.com/hunson-abadeer/MiSTer-docker-build
```
### Compiling ARM compatible binary
```
git clone https://github.com/MiSTer-devel/Main_MiSTer
cd Main_MiSTer
../MiSTer-docker-build/mister_arm_compile.sh make clean
../MiSTer-docker-build/mister_arm_compile.sh make
```
If compile was successful there will be a new file `MiSTer` in the `Main_MiSTer` directory.
### Compile FPGA core using Quartus Lite 17.0.2
```
cd ..
git clone https://github.com/MiSTer-devel/MegaCD_MiSTer
cd MegaCD_MiSTer
../MiSTer-docker-build/mister_quartus_compile.sh MegaCD
```
If compile was successful there will be a new file `MegaCD.rbf` in the `MegaCD_MiSTer/output` directory.
## Notes
The first time `mister_quartus_compile.sh` and `mister_arm_compile.sh` are run will invoke Docker to download and install two separate docker images.

This can take considerable time depending on the network bandwidth available.  This is a one time time cost and subsequent runs will not need to perform this step.

Compiling the RBF core files can take considerable time and memory.  Compiling the MegaCD core took around 7GB of memory and 30 minutes.  The `MegaCD.flow.rpt` file written to the `MegaCD_MiSTer/output` directory reports build time and memory usage.


## Acknowledgements
This repo is based upon https://github.com/chriz2600/quartus-lite.

Thank you to all the developers who have contributed to the amazing MiSTer project!
