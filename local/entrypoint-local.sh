# Setup vnc config directory
mkdir $HOME/.vnc


# chown vnc:vnc windows_machine_logged_in.ova

# import machine image into virtualbox
vboxmanage import windows_machine_logged_in.ova

# Setup vnc x server entrypoint
echo "vboxmanage startvm 'windows_machine 1' --type gui" > $HOME/.vnc/xstartup
# echo virtualbox > $HOME/.vnc/xstartup

# Start vnc server
tigervncserver :2 -SecurityTypes none

# Start the vnc client
/opt/noVNC/utils/launch.sh --listen 8081 --vnc localhost:5902

# Make the program window fullscreen
# DISPLAY=:2 /fullscreen-always.sh "VirtualBoxVM" &

# wait
