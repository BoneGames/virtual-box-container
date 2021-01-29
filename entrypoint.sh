# Setup vnc config directory
mkdir $HOME/.vnc


### GET .OVA FILE REMOTELY ##
#get file ID
# LINK=
# FILEID=$(echo $LINK | sed -r 's|https.+?com\/file\/d\/(.+?)\/view.+?|\1|p')
# #specify downloaded file name or default to 'download'
# FILENAME='windows_machine_logged_in.ova'
# # do webget
# wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1TghseeKMPkz0qbgAZ8Tjm_J-vueeDWvp' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1TghseeKMPkz0qbgAZ8Tjm_J-vueeDWvp" -O $FILENAME && rm -rf /tmp/cookies.txt
### GET .OVA FILE REMOTELY ##
./gdrive-webget.sh {}

# chown vnc:vnc windows_machine_logged_in.ova

# import machine image into virtualbox
vboxmanage import /cloud-computer/virtual-machines/windows_machine_logged_in.ova

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
