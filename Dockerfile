FROM ubuntu:18.04
LABEL version='1.0.0'

MAINTAINER sslee <SSSSSSL@github.com> <sslee@rgblab.kr>

ARG DEBIAN_FRONTEND=noninteractive

EXPOSE 5760
EXPOSE 5763

SHELL ["/bin/bash", "-c"]

ENV TZ=Asia/Seoul
ENV USER=root
ENV PATH=/root/.local/bin:$PATH

RUN apt-get update -y
RUN apt-get install -y git sudo tzdata

RUN git config --global url."https://".insteadOf git://
RUN git clone https://github.com/ArduPilot/ardupilot.git

WORKDIR /ardupilot
RUN git checkout Copter-4.0.7
RUN git submodule update --init --recursive
RUN Tools/environment_install/install-prereqs-ubuntu.sh -y

WORKDIR /ardupilot

# BUILD SITL
RUN /ardupilot/modules/waf/waf-light configure --board sitl
RUN /ardupilot/modules/waf/waf-light build --target bin/arducopter

#CMD /ardupilot/Tools/autotest/sim_vehicle.py -v ArduCopter
CMD /ardupilot/build/sitl/bin/arducopter -S -I0 --model + --speedup 1 --defaults /ardupilot/Tools/autotest/default_params/copter.parm --home 35.8925079,128.598849,0,0
