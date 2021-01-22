# Setup vnc config directory
# mkdir $HOME/.vnc

# Setup vnc x server entrypoint
# echo "VBoxManage startvm '/home/vnc/windows_machine_GA.ova' --type gui" > $HOME/.vnc/xstartup
# echo virtualbox > $HOME/.vnc/xstartup
# echo xeyes > $HOME/.vnc/xstartup

# Start vnc server
tigervncserver :2 -SecurityTypes none -xstartup openbox

sleep 2

DISPLAY=:2 VBoxManage startvm "windows_machine 1" &

# Start the vnc client
/opt/noVNC/utils/launch.sh --listen 8081 --vnc localhost:5902

# Make the program window fullscreen
DISPLAY=:2 /fullscreen-always.sh "VirtualBox Machine" &

wait
