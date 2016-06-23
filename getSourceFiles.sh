#! /bin/bash
# create folder
mkdir ./sourceFiles
# get files from emc.com/getscaleio
wget http://downloads.emc.com/emc-com/usa/ScaleIO/ScaleIO_Linux_v2.0.zip -P ./sourceFiles
# unzip source files and package for Linux GUI
unzip ./sourceFiles/ScaleIO_Linux_v2.0.zip -d ./sourceFiles
unzip ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download.zip -d ./sourceFiles
unzip ./sourceFiles/ScaleIO_2.0.0_GUI_for_Linux_Download.zip -d ./sourceFiles
# install GUI
dpkg -i ./sourceFiles/ScaleIO_2.0.0_GUI_for_Linux_Download/EMC-ScaleIO-gui-2.0-5014.0.deb
