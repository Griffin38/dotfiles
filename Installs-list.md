#GO GUIDE


## Add yay

```https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/```
- git clone https://aur.archlinux.org/yay.git
- cd yay
- makepkg -si

## Add NVM

```https://wiki.archlinux.org/index.php/Node.js_```
- yay nvm
- echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc

## Add Rbenv
- yay rbenv
- rbenv init
- echo 'eval "$(rbenv init -)"' >> ~/.bashrc
- yay ruby-build
- curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

## Add Direnv
- yay direnv
- echo 'eval "$(direnv hook bash)"' >> ~/.bashrc

## Add postgresql
- sudo pacman -S postgresql
- sudo su postgres -l
- initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data/'
- exit
- sudo systemctl enable --now postgresql.service

