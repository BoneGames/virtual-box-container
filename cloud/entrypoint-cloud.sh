# Setup vnc config directory
mkdir $HOME/.vnc


### GET .OVA FILE REMOTELY ##
LINK='https://drive.google.com/file/d/1kFSFHtrfsnwHzpekPb0ASLO9KoWt8mrt/view?usp=sharing'
FILENAME='windows_machine_logged_in.ova'
./gdrive-webget.sh "$LINK" "$FILENAME"

# all hardcoded version
# wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1kFSFHtrfsnwHzpekPb0ASLO9KoWt8mrt' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1kFSFHtrfsnwHzpekPb0ASLO9KoWt8mrt" -O 'windows_machine_logged_in.ova' && rm -rf /tmp/cookies.txt### GET .OVA FILE REMOTELY ##


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
