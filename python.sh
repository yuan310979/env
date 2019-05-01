#!/bin/bash
sudo apt-get update
sudo apt-get upgrade

while true; do
    read -p "Do you want to install Anaconda3? (Y/N)" yn
    case $yn in
        [Yy])
            # install Anaconda3
            fileName=`curl -sS https://www.anaconda.com/download/\#linux | grep -Po 'Anaconda3(.*?)x86_64\.sh' | sed -n '2p'`
            curl -fsSL https://repo.anaconda.com/archive/$fileName > anaconda.sh
            bash ./anaconda.sh
            rm ./anaconda.sh
            ;;
        [Nn])
            exit
            ;;
        *)
            echo "Please answer Y or N."
    esac
done

# install opencv
sudo apt-get install build-essential cmake pkg-config libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev
sudo apt-get install libjpeg-dev libpng-dev libtiff5-dev libavcodec-dev libavformat-dev libswscale-dev pkg-config libgtk2.0-dev libopenblas-dev libatlas-base-dev liblapack-dev libeigen3-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common libtbb-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libopenexr-dev libgstreamer-plugins-base1.0-dev libavcodec-dev libavutil-dev libavfilter-dev libavformat-dev libavresample-dev ffmpeg
sudo apt-get install libgtk-3-dev
sudo apt-get install libatlas-base-dev gfortran
sudo apt-get install python2.7-dev python3.6-dev
git clone https://github.com/opencv/opencv.git $HOME/
cd $HOME/opencv/
mkdir Release
cd Release
cmake -DBUILD_opencv_python3=yes -DBUILD_TIFF=ON -DBUILD_opencv_java=OFF -DWITH_CUDA=OFF -DWITH_OPENGL=ON -DWITH_OPENCL=ON -DWITH_IPP=ON -DWITH_TBB=ON -DWITH_EIGEN=ON -DWITH_V4L=ON -DWITH_VTK=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DCMAKE_BUILD_TYPE=RELEASE ..
make
sudo make install
cd $HOME

# install geopandas
conda update --all
conda install -c conda-forge ncurses fiona shapely geopandas
