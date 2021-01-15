# Setup vnc x server entrypoint
# echo "VBoxManage startvm 'windows_machine' --type gui" > $HOME/.vnc/xstartup

# Start vnc server
tigervncserver \
  -cleanstale \
  -cleanstale \
  -SecurityTypes none \
  -xstartup xeyes

# Start the vnc client
/opt/noVNC/utils/launch.sh \
  --listen 8081 \
  --vnc localhost:590$(tigervncserver -list | tail -1 | cut -c 2-5) &

sleep infinity
