#!/bin/bash

DOTFILES=$(pwd)

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

source .profile

