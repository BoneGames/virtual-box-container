# Setup vnc x server entrypoint
# echo "VBoxManage startvm 'windows_machine' --type gui" > $HOME/.vnc/xstartup

# Start vnc server
tigervncserver \
  -SecurityTypes none \
  -xstartup xeyes

# Start the vnc client
/opt/noVNC/utils/launch.sh \
  --listen 8081 \
  --vnc localhost:5901 &

sleep infinity
