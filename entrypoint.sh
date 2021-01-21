# Setup vnc config directory
mkdir $HOME/.vnc


# set up windows machine image in virtualbox
vboxmanage import windows_machine.ova

# Setup vnc x server entrypoint
echo "VBoxManage startvm 'windows_machine' --type gui" > $HOME/.vnc/xstartup
# echo virtualbox > $HOME/.vnc/xstartup
# echo xeyes > $HOME/.vnc/xstartup

# Start vnc server
tigervncserver :2 -SecurityTypes none

# Start the vnc client
/opt/noVNC/utils/launch.sh --listen 8081 --vnc localhost:5902
