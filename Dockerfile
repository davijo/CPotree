FROM ubuntu:14.04

RUN apt-get update && apt-get install -y g++ git cmake3

RUN sudo apt-get update -y && \
sudo apt-get upgrade -y && \
sudo apt-get dist-upgrade -y && \
sudo apt-get install build-essential software-properties-common -y && \
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get update -y && \
sudo apt-get install gcc-7 g++-7 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7 && \
sudo update-alternatives --config gcc

RUN sudo apt-get install -y libglm-dev

RUN mkdir /app
WORKDIR /app
RUN mkdir /app/cpotree
WORKDIR /app/cpotree
ADD . /app/cpotree
RUN mkdir /app/cpotree/build
RUN cd build && cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cd build && make
