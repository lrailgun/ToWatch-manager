#!/bin/bash
shopt -s nocasematch
SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

# importing files
source "$SCRIPT_DIR/watchlist_functions.sh"
animelist="$SCRIPT_DIR/anime.txt"
movielist="$SCRIPT_DIR/movies.txt"
serieslist="$SCRIPT_DIR/series.txt"
cartoonlist="$SCRIPT_DIR/cartoons.txt"
videolist="$SCRIPT_DIR/videos.txt"

# Associating files
mapfile -t anime < "$animelist"
mapfile -t movie < "$movielist"
mapfile -t series < "$serieslist"
mapfile -t cartoon < "$cartoonlist"
mapfile -t video < "$videolist"

# Start
echo "Welcome to ToWatch-manager."
echo "What's on your mind?"
menu_1

case $menu1_choice in
    "1")
        echo "What do you want to add?"
        menu_2
        set_type
        arrayname="$type"
        filevar="${type}list"
        add_item
        ;;
    "2")
        echo "What do you want to remove?"
        menu_2
        set_type
        arrayname="$type"
        filevar="${type}list"
        remove_item
        ;;
    "3")
        echo "What are you looking for?"
        menu_2
        set_type
        arrayname="$type"
        filevar="${type}list"
        echo "Your $type list:"
        eval "for i in \"\${!$arrayname[@]}\"; do
            echo \"\$((i+1))) \${$arrayname[i]}\"
        done"
        ;;
    "0")
        echo "See you next time!"; exit 0
        ;;
    *)
        echo "Incorrect input. Exiting..."; exit 1
        ;;
esac
