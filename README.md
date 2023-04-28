# ReBBR: Reproducing BBR Performance on Lossy Networks


## Getting started
- set up google cloud VM using ubuntu (pro) 16.04 
- ssh into the cloud based VM and complete the following steps
- git clone this repo
-    cd bbr
-    cd mahimahi/
-    sudo apt-get install python-setuptools
-    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
-    python2 get-pip.py
-    sudo easy_install pip==20.3.4
-    pip install matplotlib
-    ./init_deps.sh
- download dependencies such as linux headers for the kernel version (uname -r)

## Building BBR557 Kernel Module
- cd module
- make clean
- make
- this will remove any previous version of our custom bbr kernel module and insert a newly built one from source file

## Running Tests
- ./run_all.sh
- this will run our full test suite against standard bbr and our bbr557
- the following tests are run:
- 1 - Constant bandwidth
- 2 - step
- 3 - pulse
- 4 - verizon LTE
- 5 - ATT LTE Driving trace
- 7 - T mobile LTE

## Viewing Results
- graphs are placed mahimahi/temp and labeled accordingly
- summary data is saved in mahimahi/data in labeled csv files

