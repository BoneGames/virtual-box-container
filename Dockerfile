FROM jrei/systemd-ubuntu

RUN apt update \
    apt -y install wget gnupg2 systemd software-properties-common \
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add - \
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add - \
    add-apt-repository "deb https://download.virtualbox.org/virtualbox/debian bionic contrib"
    apt update \
    apt -y install virtualbox
