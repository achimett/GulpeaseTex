#!/bin/bash -l

# Documento scritto da Alessandro Chimetto <alessandro.chimetto.it@gmail.com>
# e rilasciato sotto licenza Unlicense <http://unlicense.org/>

mkdir -p $GITHUB_WORKSPACE/$2

while IFS= read -r path
do
    if [ -n "$path" ]
    then
        name=$(basename $path)
        cd $GITHUB_WORKSPACE/$path
        delatex main.tex > $GITHUB_WORKSPACE/$2/$name.txt
        cd $GITHUB_WORKSPACE/$2
        python3 /gulpease.py $name.txt > $name-eval.txt
        rm $name.txt
    fi
done < "$GITHUB_WORKSPACE/$1"

