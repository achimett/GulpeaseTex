#!/bin/bash -l

# Documento scritto da Alessandro Chimetto <alessandro.chimetto.it@gmail.com>
# e rilasciato sotto licenza Unlicense <http://unlicense.org/>

mkdir -p $GITHUB_WORKSPACE/$2
cd $GITHUB_WORKSPACE/$2

while IFS= read -r path $1
do
    if [ -n "$path" ]
    then
        name=$(basename $path)
        delatex $path/main.tex > ./$name.txt
        python3 /gulpease.py ./$name.txt > ./$name.txt
    fi
done

