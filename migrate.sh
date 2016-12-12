#!/bin/bash
# Add required repositories
repolist=repos
if [ -e "$repolist" ]
then
	for repo in $(cat $repolist)
	do
		#echo $repo
		sudo apt-add-repository $repo
	done
fi
sudo apt-get update
# Find new packages to be installed
packlist=installed
if [ ! -e "$packlist" ]
then
	exit 1
fi
apt list --installed | awk -F"/" '{print $1}' > current
packcurrent=current

to_install=$(diff -y --suppress-common-lines $packlist $packcurrent | awk '{print $1}')
for package in $to_install
do
	if [ "$package" != ">" ]
	then
	#echo "Installing $package"
	sudo apt-get install $package -y
	fi
done
