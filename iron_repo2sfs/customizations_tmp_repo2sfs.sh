#!/bin/sh
echo "SW - IRON browser CUSTOMIZATION SCRIPT"
#############
# SWIRON CUSTOMIZATION SCRIPT  jonmod 180514a 
#############

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
MYFILENAMEextracted=$1
echo "Iron config using FILENAME="$MYFILENAMEextracted

mkdir -p ./$MYFILENAMEextracted/usr/bin
chmod 755  ./$MYFILENAMEextracted/usr/share/iron/chrome-wrapper
chown root ./$MYFILENAMEextracted/usr/share/iron/chrome-sandbox
chmod 4755 ./$MYFILENAMEextracted/usr/share/iron/chrome-sandbox
chmod 4755 ./$MYFILENAMEextracted/usr/lib/x86_64-linux-gnu/iridium-browser/iridium-browser_sandbox
chmod 4755 ./$MYFILENAMEextracted/usr/lib/iridium-browser/chrome-sandbox

# needs extras: libnss3 libgconf-2-4

#--------------------------------------------------------------------------------------------------------------------------------

#!/bin/sh
cat > ./$MYFILENAMEextracted/usr/bin/iron-puppy << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171"
xhost +local:puppy
#su - puppy -c "/usr/bin/chromium  --user-data-dir=/home/puppy/iron_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "/usr/share/iron/chrome-wrapper --user-data-dir=/home/puppy/iron_puppy_user_data_dir --disk-cache-dir=/home/puppy/iron_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins \$1"
EOF
chmod 755 ./$MYFILENAMEextracted/usr/bin/iron-puppy

cat > ./$MYFILENAMEextracted/usr/share/applications/iron_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=SRWare Iron puppy -repo2sfs changes.dat
Comment=SRWare Iron-Browser
Exec=iron-puppy
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iron_product_logo.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=IronSW
StartupNotify=false
EOF2

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > ./$MYFILENAMEextracted/usr/bin/iron-puppy-sda1.sh << EOF31
#!/bin/sh
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171"
xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/iron
mkdir -p /mnt/sda1/downloads_linux/.cache/iron
#su - puppy -c "/usr/bin/chromium  --user-data-dir=/home/puppy/iron_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "/usr/share/iron/chrome-wrapper --user-data-dir=/mnt/sda1/downloads_linux/.data/iron --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/iron --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins --disk-cache-size=10000000 --media-cache-size=10000000 \$1"
EOF31
chmod 755 ./$MYFILENAMEextracted/usr/bin/iron-puppy-sda1.sh

cat > ./$MYFILENAMEextracted/usr/share/applications/iron-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=SRWare Iron puppy -sda1(C:) EXTERNAL repo2sfs
Comment=SRWare Iron-Browser
Exec=iron-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iron_product_logo.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=IronSW
StartupNotify=false
EOF32
fi


################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > ./$MYFILENAMEextracted/usr/bin/iron-puppy-sdb1.sh << EOF41
#!/bin/sh
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171"
xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/iron
mkdir -p /mnt/sdb1/downloads_linux/.cache/iron
#su - puppy -c "/usr/bin/chromium  --user-data-dir=/home/puppy/iron_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "/usr/share/iron/chrome-wrapper --user-data-dir=/mnt/sdb1/downloads_linux/.data/iron --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/iron --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins --disk-cache-size=10000000 --media-cache-size=10000000 \$1"
EOF41
chmod 755 ./$MYFILENAMEextracted/usr/bin/iron-puppy-sdb1.sh

cat > ./$MYFILENAMEextracted/usr/share/applications/iron-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=SRWare Iron puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Comment=SRWare Iron-Browser
Exec=iron-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iron_product_logo.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=IronSW
StartupNotify=false
EOF42
fi

echo "DONE with CUSTOMAZATION of ./$MYFILENAMEextracted ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "