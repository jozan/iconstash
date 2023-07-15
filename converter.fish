#!/usr/bin/env fish

mkdir -p ./output/heroicons-solid-24

find ./node_modules/heroicons/24/solid -type f -name "*.svg" | while read -l file
    set name (basename $file .svg)
    set newname (echo $name | awk -F"-" '{for(i=1;i<=NF;i++){printf toupper(substr($i,1,1)) substr($i,2)""}} END{print "Icon"}')
    cp $file ./output/heroicons-solid-24/$newname.svg
end

bun run svgo
