#!/bin/bash
shopt -s nocasematch # Making script non case-sensitive
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# importing files
source $SCRIPT_DIR/watchlist_functions.sh
animelist="$SCRIPT_DIR/anime.txt"
movielist="$SCRIPT_DIR/movies.txt"
serieslist="$SCRIPT_DIR/series.txt"
cartoonlist="$SCRIPT_DIR/cartoons.txt"
videolist="$SCRIPT_DIR/videos.txt"

# Associating files
mapfile -t anime < $animelist
mapfile -t movie < $movielist
mapfile -t series < $serieslist
mapfile -t cartoon < $cartoonlist
mapfile -t video < $videolist

# Announcing menus


#Start
echo "Welcome to ToWatch-manager."
echo "What's on your mind?"
menu_1
case $menu1_choice in
    "1") # Defining what to add
        echo "What do you want to add?"
        menu_2
        set_type
        arrayname="$type" # Setting correct array
        filevar="${type}list" # Setting correct file
        add_item;;
    "2") # Defining what to remove
        echo "What do you want to remove?"
        menu_2
        read menu2_choice
        set_type
        arrayname="$type" # Setting correct array
        filevar="${type}list" # Setting correct file
        remove_item;;
    "3") # Defining what to browse
        echo "What are you looking for?"
        menu_2
        read menu2_choice
        set_type
        arrayname="$type" # Setting correct array
        filevar="${type}list" # Setting correct file
        echo "Your $type list:"
        eval "for i in \"\${!$arrayname[@]}\"; do
            echo \"\$((i+1))) \${$arrayname[i]}\"
        done";;
    "0") echo; echo "See you next time!"; sleep 0.5; echo "exiting..."; sleep 0.5; exit 0;;
    *) echo; echo "Incorrect input"; sleep 0.5; echo "exiting..."; sleep 0.5; exit 1;;
esac
