# Prepare vnc application
# mkdir $HOME/.vnc
# echo "VBoxManage startvm 'windows_machine' --type gui" > $HOME/.vnc/xstartup
# echo "xeyes" > $HOME/.vnc/xstartup

# Clear previous X server sockets and locks
ls /tmp/.X11-unix/
# rm -rf /tmp/.X11-unix/*

vncserver -list

# Start vnc server
tigervncserver -SecurityTypes none -xstartup xeyes

cat /home/vnc/.vnc/Binux:1.log

# Start the vnc client
/opt/noVNC/utils/launch.sh --listen 8080 --vnc localhost:5901 &
