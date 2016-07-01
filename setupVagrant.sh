#!/bin/bash

	echo "Provisioning virtual machine..."
	apt-get update
	echo "Installing git nano jre unzip"
    apt-get install -y git nano default-jre default-jdk unzip
	add-apt-repository ppa:webupd8team/java -y
	apt-get update
	apt-get install -y oracle-java8-installer
	echo "Installing gcloud sdk"
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    sudo apt-get update && sudo apt-get install google-cloud-sdk
	
