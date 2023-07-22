#!/usr/bin/env fish

# heroicons
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

# ionicons
set dir_path "./output/ionicons/solid"
set output_file "./ionicons.ts"
set filter_list "./filter_ionicons"
touch $filter_list

echo "export const IonIcons = [" > $output_file

for file in $dir_path/*.svg
    set filename (basename -- "$file" .svg)

    if rg -Fxq $filename $filter_list
        continue
    end

    echo "{ id: \"ionicon-$filename\", getIcon: () => require(\"./ionicons/solid/$filename.svg\") }, " >> $output_file
end

echo "] as const" >> $output_file

# ionicons solid -> png
set dir_path "./output/ionicons/solid"
set output_file "./ionicons_png.ts"
set filter_list "./filter_ionicons"
touch $filter_list

echo "export const IonIcons = [" > $output_file

for file in $dir_path/*.svg
    set filename (basename -- "$file" .svg)

    if rg -Fxq $filename $filter_list
        continue
    end

    echo "{ id: \"ionicon-$filename\", getIcon: () => require(\"./ionicons/solid-png/$filename.png\") }, " >> $output_file
end

echo "] as const" >> $output_file
