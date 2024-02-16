#!/bin/bash
echo " _________    ________      ___  ___      ________       _______       ________                                           "
echo " |\___   ___\ |\   __  \    |\  \|\  \    |\   ____\     |\  ___ \     |\   ____\                                          "
echo " \|___ \  \_| \ \  \|\  \   \ \  \|\  \   \ \  \___|_    \ \   __/|    \ \  \___|                                          "
echo "      \ \  \   \ \   __  \   \ \   __  \   \ \_____  \    \ \  \_|/__   \ \  \                                             "
echo "       \ \  \   \ \  \ \  \   \ \  \ \  \   \|____|\  \    \ \  \_|\ \   \ \  \____                                        "
echo "        \ \__\   \ \__\ \__\   \ \__\ \__\    ____\_\  \    \ \_______\   \ \_______\                                      "
echo "         \|__|    \|__|\|__|    \|__|\|__|   |\_________\    \|_______|    \|_______|                                      "
echo "                                            \|_________|                                                                  "
echo "  ___  __        ________      ___           ___          ________      ___  ___      ___      ___           ________      "
echo " |\  \|\  \     |\   __  \    |\  \         |\  \        |\   __  \    |\  \ |\ \    |\  \    |\  \         |\   ___ \     "
echo " \ \  \/  /|_   \ \  \|\  \   \ \  \        \ \  \       \ \  \|\ /_   \ \  \ \| \   \ \  \   \ \  \        \ \  \_|\ \    "
echo "  \ \   ___  \   \ \   __  \   \ \  \        \ \  \       \ \   __  \   \ \  \ \| \   \ \  \   \ \  \        \ \  \ \| \   "
echo "   \ \  \ \ \ \   \ \  \ \  \   \ \  \____    \ \  \       \ \  \|\  \   \ \  \ \| \   \ \  \   \ \  \____    \ \  \_\| \  "
echo "    \ \__\ \ \_\   \ \__\ \__\   \ \_______\   \ \__\       \ \_______\   \ \_______\   \ \__\   \ \_______\   \ \_______\ "
echo "     \|__| \|__|    \|__|\|__|    \|_______|    \|__|        \|_______|    \|_______|    \|__|    \|_______|    \|_______| "
echo "                                                                                                                          "
echo "  ________       ________      ________      ___      ________    _________                                                "
echo " |\   ____\     |\   ____\    |\   __  \    |\  \    |\   __  \  |\___   ___\                                              "
echo " \ \  \___|_    \ \  \___|    \ \  \|\  \   \ \  \   \ \  \|\  \ \|___ \  \_|                                              "
echo "  \ \_____  \    \ \  \        \ \   _  _\   \ \  \   \ \   ____\     \ \  \                                               "
echo "   \|____|\  \    \ \  \____    \ \  \ \ \|   \ \  \   \ \  \___|      \ \  \                                              "
echo "     ____\_\  \    \ \_______\   \ \__\  \_\   \ \__\   \ \__\          \ \__\                                             "
echo "    |\_________\    \|_______|    \|__|   |__|  \|__|    \|__|           \|__|                                             "
echo "    \|_________|                                                                                                           "
echo ""
echo ""
echo "TahSec Kali Build Script! After you install Kali, just run this script to get the usual suspects installed and configured (hopefully correctly!)"
echo ""
read -p "Press enter to start the download and update!"
echo ""
echo "Get the latest updates..."
echo ""
sudo apt-get update && sudo apt-get upgrade -y

echo ""
echo "Installing pwn and reversing tools"
echo ""
sudo apt-get install ltrace strace ghidra gdb apktool edb-debugger -y
sudo pip3 install pwn		#useful for lots of python scripts

echo ""
echo "Installing WiFi tools"
sudo apt-get install hcxdumptool hcxpcapngtool -y

echo ""
echo "Installing OSINT tools"
sudo apt-get install sherlock -y

echo ""
echo "Installing crypto tools"
sudo apt-get install fcrackzip gpg -y		#fcrackzip sometimes plays up, just use zip2john and then john/hashcat

echo ""
echo "Installing RSACTFTOOL - very useful for RSA based challenges"
git clone https://github.com/Ganapati/RsaCtfTool.git
sudo apt-get install libgmp3-dev libmpc-dev python3-pip sagemath -y

cd RsaCtfTool
pip3 install -r "requirements.txt"
chmod +x RsaCtfTool.py.py
sudo cp RsaCtfTool.py.py /usr/local/bin/dtmf
cd ..
echo "export PYTHONPATH=""${PYTHONPATH}:/home/kali/Downloads/RsaCtfTool/lib""" >> ~/.bashrc

echo ""
echo "Installing steg tools"
sudo apt-get install steghide stegsnow stegosuite gimp audacity -y
sudo sh -c "$(curl -fs https://www.aperisolve.com/install.sh)"

echo ""
echo "Installing tool to convert phone beeps into numbers" # For challenges where they give you phone beeps and you need to know what numbers they use. To convert to SMS talk, use SMS on dcode.fr
git clone https://github.com/ribt/dtmf-decoder.git
cd dtmf-decoder/
sudo python3 -m pip install -r requirements.txt --upgrade
chmod +x dtmf.py
sudo cp dtmf.py /usr/local/bin/dtmf


echo ""
echo "Installing misc and other items..."
git clone https://github.com/danielmiessler/SecLists	#very useful collection of things, including great username and password lists
sudo apt-get install htop libreoffice -y

echo ""
echo "Additional Random Config and fun things..."
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz	#unzip rockyou.txt, 14 million passwords
sudo updatedb										#So you can use "locate" nice and quickly
sudo apt-get install cowsay cmatrix -y


echo ""
read -p "Do you want to download Crackstation's 1.4B password list (4.2GB)? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cd /usr/share/wordlists 
  sudo wget https://crackstation.net/files/crackstation.txt.gz
  sudo gzip -d crackstation.txt.gz
fi

echo ""
read -p "Do you plan on using the Alfa AWUS036NHA, Alfa AWUS036ACM,  Alfa AWUS036ACH and/or similar 5Ghz adapters ? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt install realtek-rtl88xxau-dkms
  sudo apt install dkms
  git clone https://github.com/aircrack-ng/rtl8812au
  cd rtl8812au/
  make
  sudo make install
  lsusb
  iwconfig
fi

echo ""
echo ""
echo ""
cowsay "Done! Time get get some flags!! (I'd shutdown then snapshot this VM first!!)"
echo ""
read -p "Do you want to shutdown (so you can snapshot the VM)? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo shutdown -h now
fi
echo ""
echo ""
