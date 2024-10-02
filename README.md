# debian-installation

This is a quick-installer for Debian-based OS (meaning installation is driven by the apt package manager).

The setup is quite simple, to add a program you need to do three steps:

1. Add a folder with the name of the program to this repo.
1. Add a script `install.sh` to the folder.  Make sure to have judicious use of .gitignores for config files housed in these folders.
1. Add the folder name to `programs.txt`.

I have added a simple foo folder for example. 
