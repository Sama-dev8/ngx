#!/bin/bash
clear

echo "====================================================="
echo          NGINX INSTALLATION WILL BEGIN SOON
echo "====================================================="
sleep 5


#-----------------------------------------------------------------
echo "Checking if docker is installed or not?"
sleep 3
wget https://download.docker.com/linux/debian/gpg

if [ $? -eq 0 ]; then
   echo "------Step 1: OKK!!!-------"
else
    echo "!!!Failed!!!"
    exit 1
fi
sleep 5
clear

#-----------------------------------------------------------------
sudo apt-get install gnupg2
sleep 1
clear

#-----------------------------------------------------------------
sudo apt-key add gpg

if [ $? -eq 0 ]; then
   echo "------Step 2: OKK!!!-------"
else
    echo "!!!Failed!!!"
    exit 1
fi
sleep 2
clear
#-----------------------------------------------------------------
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee -a /etc/apt/sources.list.d/docker.list

if [ $? -eq 0 ]; then
   echo "------Step 3: OKK!!!-------"
else
    echo "!!!Failed!!!"
    exit 1
fi
sleep 2
clear
#-----------------------------------------------------------------
sudo apt update

if [ $? -eq 0 ]; then
   echo "------Step 4: OKK!!!-------"
else
    echo "!!!Failed!!!"
    exit 1
fi
sleep 2
clear
#-----------------------------------------------------------------
echo "Downloading Docker-Compose "
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y

if [ $? -eq 0 ]; then
   echo "------Docker Compose Downloaded-------"
else
    echo "!!!Failed!!!"
    exit 1
fi
sleep 2
clear
#-----------------------------------------------------------------
echo "Docker & Docker compose installation Completed Successfully!"
echo " #-------Setiing up few things--------#"
sleep 4
sudo systemctl enable docker.service
sleep 1
sudo systemctl start docker.service
sleep 1
sudo systemctl enable containerd.service
sleep 1
clear
#-----------------------------------------------------------------

clear
echo "====================================================="
echo    NGINX REVERSE PROXY INSTALLATION WILL BEGIN SOON
echo "====================================================="

sleep 5

#------------------
#install zip & unzip tools
sudo apt install zip
clear
#-----------------
cd /home/nignx
git clone https://github.com/Samar-dev0/mytest.git
if [ $? -eq 0 ]; then
   echo "PP Cloned"
else
    echo "!!!Failed!!!"
    exit 1
fi
sleep 3
clear
#-----------------
cd mytest
echo "Wait...Its about to end!"
sleep 5
clear
#-----------------------------------------------------------------
echo "Running docker-compose file"
sleep 1
sudo docker-compose up -d
if [ $? -eq 0 ]; then
   echo "NGINX INSTALLED SUCCESSFULLY!"
else
    echo "!!!Failed!!!"
    exit 1
fi
sleep 2
clear

echo "GO TO http://YOUR-SERVER-IP:81"
sleep 5
clear
#-----------------------------------------------------------------
