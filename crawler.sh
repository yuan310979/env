#!/bin/sh
#### Description: Installation of all the web crawling tool
#### Written by: Peter Lee - chc71340@gmail.com

# install selenium
echo "========== Install Selenium for Python ========="
VERSION=`curl -sS https://sites.google.com/a/chromium.org/chromedriver/downloads | grep -oP 'Latest-Release:-ChromeDriver-[0-9.]+' | awk -F'-' '{print $4}'`
wget -nv https://chromedriver.storage.googleapis.com/$VERSION/chromedriver_linux64.zip 
unzip -q chromedriver_linux64.zip
chmod u+x ./chromedriver 
sudo mv -f ./chromedriver /usr/local/share/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
rm ./chromedriver_linux64.zip
