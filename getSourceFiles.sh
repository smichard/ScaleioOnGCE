#! /bin/bash
# get files from emc.com/getscaleio
wget http://downloads.emc.com/emc-com/usa/ScaleIO/ScaleIO_Linux_v2.0.zip
# unzip source files and package for Linux GUI
unzip ./ScaleIO_Linux_v2.0.zip
mv ./ScaleIO_2.0.0.1_Complete_Linux_SW_Download ./sourceFiles 
mv ./ScaleIO_Linux_v2.0.zip ./sourceFiles/ScaleIO_Linux_v2.0.zip
# install GUI
dpkg -i ./sourceFiles/ScaleIO_2.0.0.1_GUI_for_Linux_Download/EMC-ScaleIO-gui-2.0-6035.0.deb
