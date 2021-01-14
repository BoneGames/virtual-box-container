FROM jrei/systemd-ubuntu

RUN apt update

RUN apt -y install wget gnupg2 systemd software-properties-common

RUN wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -

RUN wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -

RUN add-apt-repository "deb https://download.virtualbox.org/virtualbox/debian bionic contrib"

RUN apt update

RUN apt -y install virtualbox

WORKDIR /cloud-computer/virtual-machines

COPY /windows_machine.ova .

RUN vboxmanage import windows_machine.ova
