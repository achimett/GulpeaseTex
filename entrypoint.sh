#!/bin/bash -l

# Documento scritto da Alessandro Chimetto <alessandro.chimetto.it@gmail.com>
# e rilasciato sotto licenza Unlicense <http://unlicense.org/>

cd $GITHUB_WORKSPACE
mkdir $2
cd $2

while IFS= read -r path $1
do
    if [ -n "$path" ]
    then
        name=$(basename $path)
        delatex $path/main.tex > ./$name.txt
        python3 /gulpease.py ./$name.txt > ./$name.txt
    fi
done

