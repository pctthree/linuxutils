#!/bin/bash

clear
printf "Git Update (push/pull) Utility\n\n"
printf "  Would you like to pul(L) or pus(H): "
read PullOrPush

printf "\n\n"

case $PullOrPush in
  L)
    git pull
    ;;
  H)
    printf "  Would you like to push a specific (F)ile or (A)ll: "
    read FileOrAll

    case $FileOrAll in
      F)
        printf "  File name: "
        read FileOrAll
        GitCmd="git add $FileOrAll"
        $GitCmd
        git commit
        git push
        ;;
      A)
        git add -A
        git commit
        git push
        ;;
    esac
esac

