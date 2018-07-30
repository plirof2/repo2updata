#change MYFILENAME and MYVERSION to help renaming
echo "1st download SWIron from here : http://www.srware.net/downloads/iron64.deb  , Links can be found from forum eg https://www.srware.net/forum/viewtopic.php?f=18&t=21239"
echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=iron64.deb
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
wget http://www.srware.net/downloads/$MYFILENAME
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
#../repo2sfs_custom $MYFILENAME
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs
uextract $MYFILENAME
mv ./chrome-sandbox__iridium-browser_58 "./"$MYFILENAME".extracted/usr/lib/iridium-browser/chrome-sandbox"
mv $MYFILENAME.extracted/control "./"$MYFILENAME".extracted/"$MYFILENAME"_control.txt"
rm $MYFILENAME.extracted/conffiles
rm $MYFILENAME.extracted/md5sums
rm $MYFILENAME.extracted/postinst
rm $MYFILENAME.extracted/prerm
./customizations_tmp_repo2sfs.sh "$MYFILENAME.extracted"
echo "NOW COPYING....."
#cp -avpr ./$MYFILENAME.extracted /  
cd $MYFILENAME.extracted
cp -avpr ./ /
echo "Latest SWIRON amd64 version should be installed now"
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs