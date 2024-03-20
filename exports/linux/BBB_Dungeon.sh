#!/bin/sh
echo -ne '\033c\033]0;BBB-Game-Jam-2024-Dungeon-Crawler\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/BBB_Dungeon.x86_64" "$@"
