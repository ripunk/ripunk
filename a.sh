#!/bin/bash
#creat by Ripunk
clear
function eror(){
eror=$?
if [ $eror != 0 ]; then
    echo "Eror"
    exit
fi
}
command -v add-apt-repository &> /dev/null
echo -e "[#] Seems like software-properties-common not installed! Installing..."
sudo apt install software-properties-common -y &> /dev/null

echo -e "[*] Adding repo..."
add-apt-repository "deb http://ports.ubuntu.com/ubuntu-ports xenial main restricted universe multiverse"
add-apt-repository "deb http://ports.ubuntu.com/ubuntu-ports xenial-security main restricted universe multiverse"
add-apt-repository "deb http://ports.ubuntu.com/ubuntu-ports xenial-updates main restricted universe multiverse"
add-apt-repository "deb http://ports.ubuntu.com/ubuntu-ports xenial-backports main restricted universe multiverse"
echo -e "Fixing GPG Keys..."
gpg --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 > /dev/null 2>&1
sleep 1
gpg -a --export 3B4FE6ACC0B21F32 | sudo apt-key add - > /dev/null 2>&1
echo -e "[*] Updating..."
apt update
eror
echo -e "[*] Installing GCC 4.9..."
apt install gcc-4.9 g++-4.9 -y
eror
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 30 > /dev/null 2>&1
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 30 > /dev/null 2>&1
sleep 0.5
echo -e "[*] Done!"
echo -e "[*] Installing required packages..."
apt update
DEBIAN_FRONTEND=noninteractive apt install bison build-essential curl flex git gnupg gperf liblz4-tool libncurses5-dev libsdl1.2-dev libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev build-essential libncurses5-dev bzip2 git python2 bc -y 
eror
sleep 2
echo "export CROSS_COMPILE= " >> /root/.bashrc
echo -e "[*] Done!"
