#!/usr/bin/env fish

set previous_clip ""
set filter_list "./filter_heroicons"
touch $filter_list

# Run an infinite loop to continuously check for changes
while true
    # Get the current clipboard contents
    set current_clip (pbpaste)

    # Compare with the previous clipboard contents
    if test "$current_clip" != "$previous_clip"
        if not string match -r -q "Icon\$" $current_clip
            echo "SKIPPED: $current_clip"
            set previous_clip $current_clip
            command sleep 0.2
            continue
        end

        echo "CHANGED: $current_clip"
        echo $current_clip >> $filter_list && sort -u $filter_list -o $filter_list
        command ./generate.fish
        cp heroicons.ts ../daylow/src/icons

        set previous_clip $current_clip
    end

    command sleep 0.2
end

