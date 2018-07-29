#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download firefox from here : https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US  , example link https://download-installer.cdn.mozilla.net/pub/firefox/releases/60.0.1/linux-x86_64/en-US/firefox-60.0.1.tar.bz2 "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=firefox-60.0.1.tar.bz2
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
#wget https://www.slimjetbrowser.com/release/$MYFILENAME
wget -O "firefox_latest.tar.bz2" "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64"
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
uextract firefox_latest.tar.bz2
./customizations_tar.bz2.sh "firefox_latest.tar.bz2.extracted"
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs


#SQUASH="$1.squashfs"
#rm -f $SQUASH
#mksquashfs $BUILDDIR $SQUASH
#mksquashfs firefox_latest.tar.bz2.extracted firefox_latest.tar.bz2_auto_v01_$TODAYDATE.squashfs
cp -pr firefox_latest.tar.bz2.extracted /