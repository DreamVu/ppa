#!/bin/sh -e

# sudo apt-get install apt-utils
# gpg --import my-private-key.asc

EMAIL="debashish.roy1998@gmail.com"

dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

# Release, Release.gpg & InRelease
apt-ftparchive release . > Release
gpg --default-key "${EMAIL}" -abs -o - Release > Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - Release > InRelease

# Commit & push
git add -A
git commit -m "$1"
git push