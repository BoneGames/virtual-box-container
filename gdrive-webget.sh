
# This script takes 2 arguments:
# 1: Gdrive download link
# 2: downloaded file name
# only the first is compulsory
# The script should download the file to the current pwd



#get file ID
# FILEID=$(echo $1 | sed -r 's|https.+?com\/file\/d\/(.+?)\/view.+?|\1|')
echo $1
FILEID=$(echo $1 | grep -oP 'com\/file\/d\/\K.+?(?=\/)')



#specify downloaded file name or default to 'download'
FILENAME="${2:-download}"

echo $FILEID

echo $FILENAME



# do webget
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=${FILEID}" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${FILEID}" -O $FILENAME && rm -rf /tmp/cookies.txt
