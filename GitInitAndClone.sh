pwd=$(pwd)
if [ "$pwd" != "/home/pi" ]
then
  echo "This script is designed be run in /home/pi. You are currently in $pwd"
  echo "Proceed (Y/n)? "
  read proceedresp
  if [ "$proceedresp" != "Y" ]
  then
    exit
  fi
fi
gitExists=$(ls -a ".git")
if [ "$gitExists" != "" ]
then
  echo
  echo "git repostitory already exists!!!"
  echo
  echo "To reset and create new git repository, remove all git directories and files,"
  echo "remove the .git file and create a READMEgit.md file"
  echo
else
  git init
  git add READMEgit.md
  git commit -m "First commit"
  git remote add origin https://github.com/pctthree/RobotCat.git
  git clone https://github.com/pctthree/RobotCat.git
  git clone https://github.com/pctthree/linuxutils.git
fi

