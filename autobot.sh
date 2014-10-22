#!/bin/bash

while test $# -gt 0; do
  case "$1" in
    --init)
      echo "first install all the npm stuff, this will create a node_modules folder"
      echo "let's check if there is a package.json"
      if [ -f 'package.json' ];
      then
        echo "found the package.json, let's see if there is anything installed"
        if [ -d 'node_modules' ];
        then
          echo "node_modules folder exists, running update"
          npm update
        else
          echo "nothing found, installing..."
          npm install --loglevel info
        fi
      else
        echo "couldn't find package.json, please add your package.json file."
      fi

      break
      ;;

    --rebuild)
      cd source && grunt concat:foundation && cd - 
      echo "done"
      break
      ;;

    --init)
      npm install
      npm update -g bower
      bower install
      break
      ;;
  esac
done

