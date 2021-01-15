FROM jrei/systemd-ubuntu

RUN apt update

RUN apt -y install wget gnupg2 systemd software-properties-common

RUN wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -

RUN wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -

RUN add-apt-repository "deb https://download.virtualbox.org/virtualbox/debian bionic contrib"

RUN apt update

RUN apt -y install virtualbox

RUN apt-get -y install git

# WORKDIR /cloud-computer/virtual-machines

# COPY /windows_machine.ova .

# RUN vboxmanage import windows_machine.ova

RUN apt-get install -y x11-apps

RUN apt-get install -qq tigervnc-scraping-server \
  tigervnc-standalone-server

# Install novnc
RUN git clone --depth 1 https://github.com/cloud-computer/noVNC.git /opt/noVNC && \
  git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify



COPY entrypoint.sh /

# Create a non-root user for safe operation
RUN useradd \
  --create-home \
  --groups audio,shadow,sudo,tty,video \
  --shell /bin/bash \
  vnc

USER vnc

ENTRYPOINT /entrypoint.sh
