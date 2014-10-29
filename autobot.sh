#!/bin/bash

while test $# -gt 0; do
  case "$1" in
    --init)
      # before we can install things we need to check if there are the following things available
      # 1. ruby

      if ! hash ruby 2> /dev/null; then
        echo "ruby is not installed, please install ruby and run this script again"
        break
      fi

      # 2. sass
      if ! hash sass 2> /dev/null; then
        echo "Sass is not installed, adding gem"
        gem install sass
        echo "Installed Sass"
      fi

      echo "install the npm stuff, this will create a node_modules folder"
      echo "let's check if there is a package.json"
      if [ -f 'package.json' ]; then
        echo "found the package.json, let's see if there is anything installed"
        if [ -d 'node_modules' ]; then
          echo "node_modules folder exists, running update"
          npm update
        else
          echo "nothing found, installing..."
          npm install --loglevel info
        fi
      else
        echo "couldn't find package.json, please add your package.json file."
      fi

      # done with the npm part! Now onto sass
      # make sass directory
      # set source directory?
      echo "creating sass directory"
      mkdir "sass"
      echo "creating output directory"
      mkdir "public"
      echo "creating"
      break
      ;;

    --rebuild)
      cd source && grunt concat:foundation && cd - 
      echo "done"
      break
      ;;

    --start)
    # make sure everything is fine and dandy? and then run?
      grunt watch
      break
      ;;
    # grunt watch task
  esac
done
