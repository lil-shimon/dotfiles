#!/bin/bash

####################################################################

# list files what you want to add symbolink
homesymfiles="tmux.conf tmux.conf.osx tmux.powerline.conf"
configsymfiles="fish nvim alacritty"
brewfiles="gopls java"
npmGlobals="git-cz intelephense diagnostic-languageserver typescript typescript-language-server"

homedir=$HOME

# dotfiles directory
dotfiledir=${homedir}/dotfiles

echo -e "install lunarVim"
bash
## install roll version of lunarvim
LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
rm -rf ${homedir}/.config/lvim/config.lua
cp ${dotfiledir}/lvim/config.lua ${homedir}/.config/

####################################################################

## symbolink #######################################################
#
####################################################################
echo -e "####################################################################\n
######################## step1: symbolink ##########################\n
####################################################################\n"

for file in ${homesymfiles}; do
  echo "$file >>> symbolink creating....."
  ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

for file in ${configsymfiles}; do
  echo "$file >>> symbolink creating....."
  ln -sf ${dotfiledir}/${file} ${homedir}/.config/${file}
done

## brew ############################################################
#
####################################################################
echo -e "####################################################################\n
########################## step2: brew #############################\n
####################################################################\n"

### for java.
sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk


## npm #############################################################
#
####################################################################
echo -e "####################################################################\n
########################### step3: npm #############################\n
####################################################################\n"


for file in ${npmGlobals}; do
  echo "$file >>> npm i ..."
  npm i -g $file
done

echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
