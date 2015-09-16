#!/bin/sh
# manager programs of android-lib

FILE=$1

#判断git是否安装
type git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed.  Aborting."; exit 1; }

string="https"

#判断$myFile是否存在
if [ -f "$FILE" ]; then
    while read line; do
        for word in $line; do
            if test "${word#*$string}" != "$word"
            then
                subString=${word#*https}
                result="git"${subString%)}".git"
                #echo $result
                git clone $result
            fi
        done
    done < $FILE
fi
