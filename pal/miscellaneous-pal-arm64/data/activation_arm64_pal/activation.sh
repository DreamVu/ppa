#!/bin/bash


jp_version=$(sudo apt-cache show nvidia-jetpack | grep Version)
if [[ $jp_version =~ "Version: 5.0.2-b231" ]]; then
	cp ./Jetpack-5.0.2/run ./

fi



./run

echo "[PAL:INFO] Camera data files are installed successfully." 

 


