# git-profile-files
A collection of some git and bash stuff i use.

visibone is just a .minttyrc file in a folder.

## Installation
Install Zsh on the following link:
https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

Then install Oh My Zsh from this instructions:
https://ohmyz.sh/#install

Install fonts from the Font folder.

Install Powerlevel10k from here:
https://github.com/romkatv/powerlevel10k#get-started

Then install bash files from this repo. 

Many good tips are taken from the user romkatv:
https://www.reddit.com/r/zsh/comments/bj6rwz/what_is_a_good_ohmyzsh_alternative/em7l131?utm_source=share&utm_medium=web2x&context=3

## Issues:

### Cloning failed due to unresolved hostname
```sh
Cloning into 'git-profile-files'...
ssh: Could not resolve hostname github.com: Temporary failure in name resolution
fatal: Could not read from remote repository.
```

This is probably becuase of a failing dns. try to run `ping github.com` and if that fails run
```sh
sudo vim /etc/resolv.conf
```
then add this to the file:
```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

### WSL overrides /etc/resolv.conf
run the following which will stop wsl from overriding the file and also make it readonly.
```sh
sudo rm /etc/resolv.conf
sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf
sudo bash -c 'echo "nameserver 8.8.4.4" > /etc/resolv.conf
sudo bash -c 'echo "[network]" > /etc/wsl.conf'
sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'
sudo chattr +i /etc/resolv.conf
```
