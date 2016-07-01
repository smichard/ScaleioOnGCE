#!/bin/bash
echo "Provisioning virtual machine..."
apt-get update
echo "Installing git nano unzip"
apt-get install -y git nano unzip
echo "Installing java8"
add-apt-repository ppa:webupd8team/java -y
apt-get update
# enable silent install
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get install -y oracle-java8-installer
echo "Installing gcloud sdk"
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
apt-get update
apt-get install google-cloud-sdk
	
