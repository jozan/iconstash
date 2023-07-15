#!/usr/bin/env fish

set dir_path "./output/heroicons-solid-24"

set output_file "./heroicons.ts"

set filter_list "./filter_heroicons"
touch $filter_list

echo "export const HeroIcons = [" > $output_file

for file in $dir_path/*.svg
    set filename (basename -- "$file" .svg)

    if rg -Fxq $filename $filter_list
        continue
    end

    echo "{ id: \"heroicon-$filename\", getIcon: () => require(\"./heroicons/$filename.svg\") }, " >> $output_file
end

echo "] as const" >> $output_file

