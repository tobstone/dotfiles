#!/bin/bash
DOTFILES=$(pwd)
git pull
git submodule init
git submodule update

mkdir -p ~/.vim_backup ~/.vim_swaps

function undlos() {
for file in *
do
  if   [ "${file}" == "bin"  ]
  then 
    cd ; rm -Rf bin; ln -s -v $DOTFILES/$file $file
    continue
  fi
  if [ "${file}" == "ReadMe.md" ] ||  [ "${file}" == "setup.bash" ] || [ "${file}" == "License" ]
  then 
    continue
  fi
  cd ; rm -Rf .$file; ln -s -v $DOTFILES/$file .$file
done
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  undlos
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		undlos
	fi
fi
unset undlos
source ~/.bash_profile
