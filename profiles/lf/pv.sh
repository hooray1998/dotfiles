#!/bin/sh

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    * ) bat --color=always --style=changes "$1" || cat "$1" ||  echo "$1" 2> /dev/null | head -50
    # * ) bat --style=numbers --color=always "$1" || cat "$1" ||  echo "$1" 2> /dev/null | head -50
    # *) head -40 "$1";;
    # *) pygmentize -P style="desert" -P tabsize=4 -f terminal256 -g "$1" || highlight -O ansi "$1" || cat "$1"
esac
