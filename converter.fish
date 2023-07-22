#!/usr/bin/env fish

mkdir -p ./output/heroicons-solid-24

find ./node_modules/heroicons/24/solid -type f -name "*.svg" | while read -l file
    set name (basename $file .svg)
    set newname (echo $name | awk -F"-" '{for(i=1;i<=NF;i++){printf toupper(substr($i,1,1)) substr($i,2)""}} END{print "Icon"}')
    cp $file ./output/heroicons-solid-24/$newname.svg
end

# ionicons
set ionicons_output_dir "./output/ionicons"
mkdir -p $ionicons_output_dir

bun run svgo

for f in ./node_modules/ionicons/dist/svg/*.svg
  switch $f
    case '*-outline.svg'
      set dir "outline"
    case '*-sharp.svg'
      set dir "sharp"
    case '*'
      set dir "solid"
  end

  mkdir -p $ionicons_output_dir/$dir

  set name (basename $f .svg)
  set newname (echo $name | awk -F"-" '{for(i=1;i<=NF;i++){printf toupper(substr($i,1,1)) substr($i,2)""}} END{print "Icon"}')

  cp $f $ionicons_output_dir/$dir/$newname.svg
end

mkdir -p ./output/ionicons/solid-png

for f in ./output/ionicons/solid/*.svg
  set name (basename $f .svg)

  inkscape $f -w 72 -o ./output/ionicons/solid-png/$newname.png
end

