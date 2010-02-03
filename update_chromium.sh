#!/bin/bash

# Based on the script by Raj at : http://rtfm-nub.blogspot.com/2009/07/how-to-get-chromium-chrome-nightly.html

BASEDIR=http://build.chromium.org/buildbot/snapshots/chromium-rel-mac
cd ~/tmp/

echo "Downloading number of latest revision"
REVNUM=`curl -# $BASEDIR/LATEST`

echo "Found latest revision number $REVNUM, starting download"

curl $BASEDIR/$REVNUM/chrome-mac.zip > $REVNUM.zip

echo "Unzipping..."
unzip $REVNUM.zip 2>&1 > /dev/null
echo "Done."

echo "Moving to Applications directory..."
rm -rf /Applications/Chromium.app/
mv chrome-mac/Chromium.app/ /Applications/
rm ~/tmp/$REVNUM
echo "Done, update successful"

