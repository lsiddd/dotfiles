#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

tmpbg="/tmp/screen.png"
scrot "$tmpbg"; $DIR/corrupter "$tmpbg" "$tmpbg"
i3lock -i "$tmpbg"; rm "$tmpbg"

