#!/bin/bash
export TARGET_PRODUCT='lcsh82_tb_3gfull_kk'
#export TARGET_BUILD_VARIANT='eng'
export TARGET_BUILD_VARIANT='user'
export CROSS_COMPILE='arm-eabi-'

# using this static build of Python 2.7:
# https://github.com/andrew-d/static-binaries/blob/master/binaries/linux/x86_64/python2.7
# also needs the rest of the fucking owl:
# https://github.com/andrew-d/static-binaries/blob/master/binaries/linux/x86_64/python2.7.zip
# files should be in: ${HOME}/.local/lib/python2.7/*.py, like python3 does it
# for such setup set:
#export PYTHONHOME="${HOME}/.local"

#python2.7 -m virtualenv python2_venv
#source python2_venv/bin/activate

export PATH="${PATH}:/media/ANDROID/fucking_compilers/gcc-arm-eabi-4.8/bin"
./makeMtk -t -o=OUT_DIR=out "${TARGET_PRODUCT}" r k

