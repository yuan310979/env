#!/bin/bash
#### Description: Installation of all the web crawling tool
#### Written by: Peter Lee - chc71340@gmail.com

linux_install(){
    # install selenium
    echo "========== Install Selenium for Python "=========
    echo "========== Install Chrome Binary ========="
    sudo apt-get install libxss1 libappindicator1 libindicator7
    wget -nv https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb
    if [ "$?" -ne 0 ]; then
        sudo apt-get install -f
        sudo dpkg -i google-chrome*.deb
    fi
    rm google-chrome*.deb

    echo "========== Install ChromeDriver ========="
    VERSION=`curl -sS https://sites.google.com/a/chromium.org/chromedriver/downloads | grep -oP 'Latest-Release:-ChromeDriver-[0-9.]+' | awk -F'-' '{print $4}'`
    wget -nv https://chromedriver.storage.googleapis.com/$VERSION/chromedriver_linux64.zip 
    unzip -q chromedriver_linux64.zip
    chmod u+x ./chromedriver 
    sudo mv -f ./chromedriver /usr/local/share/chromedriver
    sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
    sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
    rm ./chromedriver_linux64.zip
}

wsl_install(){
    echo "========== Install Selenium for Python "=========
    echo "========== Install Chrome Binary ========="
    echo "Remember to install Windows Chrome!!!"
    echo "========== Install ChromeDriver ========="
    VERSION=`curl -sS https://sites.google.com/a/chromium.org/chromedriver/downloads | grep -oP 'Latest-Release:-ChromeDriver-[0-9.]+' | awk -F'-' '{print $4}'`
    wget -nv https://chromedriver.storage.googleapis.com/$VERSION/chromedriver_win32.zip 
    unzip -q chromedriver_win32.zip
    mkdir -p /mnt/d/gdrive/Util/
    sudo mv ./chromedriver.exe /mnt/d/gdrive/Util/
    rm ./chromedriver_win32.zip
}

PS3='What system are you using?: '
options=("WSL(Windows Subsystem for Linux)" "Ubuntu")
select opt in "${options[@]}"
do
    case $opt in
        "WSL(Windows Subsystem for Linux)")
            echo "Installation for WSL is starting..."
            wsl_install
            break
            ;;
        "Ubuntu")
            echo "Installation for Ubuntu is starting..."
            linux_install
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
