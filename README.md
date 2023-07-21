# iconstash

preprocessed svg icons for an app i'm building.

## usage

you need [`bun`](https://bun.sh) installed in your system. also fish shell. and
ripgrep.

then you need to have the icons locally

```
$ bun i
```

### copy `svg` files out of `node_modules`

```
$ ./converter.fish
```

### generate the file that the app needs by running

```
$ ./generate.fish
```

copy output of that to the app with the generated svgs's.

### running watcher (optional)

```
$ ./pbwatcher.fish
```

watcher is useful when you want to filter out icons from the set. it works by
checking the content on the clipboard periodically and populating
`filter_heroicons` file.

keep watcher running in the background and copy icon names you want to filter
out to your clipboard. it'll run `generate.fish` for you.

`pbwatcher.fish` is intended to be used on macOS but can be easily converted
to be used in other systems as well by modifying the script to use `xclip`
for example.
