#!/bin/bash
icon='apps'

size[0]='16'
size[1]='22'
size[2]='24'
size[3]='32'
size[4]='48'
size[5]='64'
size[6]='96'
jumlah=0
pwd=$('pwd')
cd ${icon}/
cd scalable/
mkdir symlink
find . -maxdepth 1 -type l -exec mv {} symlink/ \;
loc=$(pwd)
echo $loc
for x in 0 1 2 3 4 5 6
do
  SAVEIF=$IFS
  IFS=$(echo -en "\n\b")
  for file in $(ls *svg)
  do
    name=${file%%.svg}
    inkscape $name.svg --export-png=$name.png --export-height=${size[x]} --export-width=${size[x]}
    mv $name.png $pwd/${icon}/${size[x]}/
    jumlah=$((jumlah+1))
  done
done
cd symlink
find . -maxdepth 1 -type l -exec mv {} .. \;
cd ..
rmdir symlink
cd $pwd
echo "Done. $jumlah icons was generated."
