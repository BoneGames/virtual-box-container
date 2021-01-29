
#get file ID
FILEID=$(echo $1 | sed -r 's|https.+?com\/file\/d\/(.+?)\/view.+?|\1|p')

#specify downloaded file name or default to 'download'
FILENAME="${2:=download}"
 
# do webget
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1TghseeKMPkz0qbgAZ8Tjm_J-vueeDWvp' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1TghseeKMPkz0qbgAZ8Tjm_J-vueeDWvp" -O $FILENAME && rm -rf /tmp/cookies.txt