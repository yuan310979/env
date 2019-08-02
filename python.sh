#!/bin/bash
sudo apt-get update

while true; do
    read -p "Do you want to install Miniconda3? (Y/N)" yn
    case $yn in
        [Yy])
            # install Anaconda3
            fileName=`curl -sS https://docs.conda.io/en/latest/miniconda.html | grep -Po 'Miniconda3-latest-Linux(.*?)x86_64\.sh'`
            curl -fsSL https://repo.anaconda.com/miniconda/$fileName > /tmp/miniconda.sh
            bash /tmp/miniconda.sh
            rm /tmp/miniconda.sh
            ;;
        [Nn])
            exit
            ;;
        *)
            echo "Please answer Y or N."
    esac
done