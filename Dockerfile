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
RUN wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add - && \
  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add - && \
  add-apt-repository "deb https://download.virtualbox.org/virtualbox/debian bionic contrib" && \
  apt-get update && \
  apt-get -qq install virtualbox

# Install novnc
RUN git clone --depth 1 https://github.com/cloud-computer/noVNC.git /opt/noVNC && \
  git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

# Copy entrypoint
COPY entrypoint.sh /

# Create a non-root user for safe operation
RUN useradd \
  --create-home \
  --groups sudo,tty,video \
  vnc

# Assume non-root user
USER vnc

# Begin entrypoint
ENTRYPOINT /entrypoint.sh
