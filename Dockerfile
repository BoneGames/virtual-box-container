FROM jrei/systemd-ubuntu

# Install dependencies
RUN apt-get -qq update && \
  apt-get -qq install \
  git \
  gnupg2 \
  software-properties-common \
  systemd \
  tigervnc-scraping-server \
  tigervnc-standalone-server \
  wget \
  x11-apps

# Install virtualbox
# RUN wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add - && \
#   wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add - && \
#   add-apt-repository "deb https://download.virtualbox.org/virtualbox/debian bionic contrib" && \
#   apt-get update && \

# install vbox dependencies
RUN apt-get -qq install psmisc \
  libcurl4 \
  libopus0 \
  libqt5core5a \
  libqt5gui5 \
  libqt5opengl5 \
  libqt5printsupport5 \
  libqt5widgets5 \
  libqt5x11extras5 \
  libsdl1.2debian \
  libvpx6

RUN apt-get -qq install python2


RUN wget -q -O vbox.deb https://download.virtualbox.org/virtualbox/6.1.10/virtualbox-6.1_6.1.10-138449~Ubuntu~eoan_amd64.deb && \
  dpkg -i vbox.deb || apt-get install -qq --fix-broken

# Install novnc
RUN git clone --depth 1 https://github.com/cloud-computer/noVNC.git /opt/noVNC && \
  git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

# put a wait until finished here so that the build step completes the process and run has the machine ready to launch

RUN apt-get -qq install nano xdotool kmod

# Create a non-root user for safe operation
RUN useradd \
  --create-home \
  --groups sudo,tty,video \
  vnc

WORKDIR /home/vnc

# Copy windows machine image
COPY windows_machine_logged_in.ova .

RUN apt-get install -y openbox

RUN chown vnc:vnc windows_machine_logged_in.ova 

# Assume non-root user
USER vnc

# set up windows machine image in virtualbox
RUN vboxmanage import windows_machine_logged_in.ova

# copy fullscreen script
COPY fullscreen-always.sh /

# Copy entrypoint
COPY entrypoint.sh /

# Begin entrypoint
ENTRYPOINT /entrypoint.sh
