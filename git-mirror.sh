#!/bin/bash
if [[ -d .git ]]; then
    a=`grep "$1" .git/config |  wc -l` 
    echo D $a
else
    a=`cat .git |  awk -F ': ' '{a=$2"/config" ; print a}' | xargs grep "$1" | wc -l`
    echo F $a
fi
if [ $a -gt '0' ]; then
	echo "El remoto ya estaba incluido"
else  
	b=`git ls-remote $1 | wc -l`
	if [ $b -eq 0 ];then
		echo "$b no parece ser un repositorio"
	else
		git remote set-url --add origin $1
	fi
fi
