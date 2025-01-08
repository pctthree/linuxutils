#!/bin/bash

SetConfigAndInit() {
  printf "Setting configuration...\n"
  git config --global core.editor vi
  git config --global user.name "pctthree"
  git config --global user.email "pctthree@yahoo.com"
  git config --global credential.helper store
  git init
}

clear
printf "    Git Repo Initialization Script\n\n"
printf "  This utility should be run in /home/pi/GitRepos parent directory.\n"
printf "  Make sure to create a sub-directory that matches the github.com repo name.\n\n"

pwd=$(pwd)
InGitRepos=$(echo "$pwd" | cut -f4 -d/)
GitReposDir=$(echo "$pwd" | rev | cut -f1 -d/ | rev)

if [ "$InGitRepos" != "GitRepos" ]
then
  printf "  It doesn't appear you're in /home/pi/GitRepos or a sub-directory]\n\n"
fi

printf "  Current directory: $pwd \n"
printf "         Repository: $GitReposDir\n\n"
printf "  Output:\n\n  Processing...\n\n"


gitExists=$(ls -a ".git" 2>/dev/null)
if [ "$gitExists" != "" ]
then
  echo
  echo "git repostitory already exists!!!"
  echo
  echo "To reset and create new git repository, remove all git directories and files,"
  echo "remove the .git file and create a READMEgit.md file"
  echo
fi
  printf "Is this a (N)ew repo or (C)lone: "
  read NewOrClone
  printf "\n"
  case $NewOrClone in
    N)
#     SetConfigAndInit
#      GitCmd="git remote add origin http://github.com/pctthree/$GitReposDir.git"
#     $GitCmd
#     git branch -M main
#     git push -u origin main
#     echo "Initial config for $pwd"> READMEgit.md
#     printf "Initializing and first commit...\n"
#     git add READMEgit.md
#     git commit -m "First commit"
#     printf "  First push...\n"
#     git push
#     printf "  Push complete\n\n"
      printf "Go to github.com and create the desired repository, then come back and use (C)lone option to initialize directory. you can then add items and git push/pull.\n\n"
      ;;
    C)
      printf "It's recommended you clone repos into /home/pi/GitRepos\n"
      printf "  Directory to clone into (will become a sub-dir in current dir: "
      read GitReposDir
      printf "\n\n  Cloning\n\n" 
      SetConfigAndInit
      GitCmd="git clone https://github.com/pctthree/$GitReposDir.git"
      $GitCmd
      ;;
  esac

printf "Process complete\n\n"

