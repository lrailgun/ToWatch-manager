#!/bin/bash
shopt -s nocasematch

menu_1() {
    echo "
1. Add new title
2. Remove existing title
3. Browse lists
0. Exit
"
    read -p "Your choice: " menu1_choice
}

menu_2() {
    echo "
1. Show anime list
2. Show movies list
3. Show series list
4. Show cartoons list
5. Show videos list
0. Exit
"
    read -p "Your choice: " menu2_choice
}

add_item() {
    echo "Your $type list:"
    eval "for i in \"\${!$arrayname[@]}\"; do
        echo \"\$((i+1))) \${$arrayname[i]}\"
    done"
    echo
    read -p "Enter the title name: " title_name
    read -p "Enter the URL: " title_url
    read -p "Add '$title_name | $title_url' to your $type list? (Y/n): " add_confirm
    add_confirm=${add_confirm:-Y}

    if [[ $add_confirm =~ ^[Yy]$ ]]; then
        eval "$arrayname+=(\"\$title_name | \$title_url\")"
        eval "printf '%s\n' \"\${$arrayname[@]}\" > \"\$$filevar\""
        echo "Title '$title_name' was successfully added to your $type list!"
        exit 0
    elif [[ $add_confirm =~ ^[Nn]$ ]]; then
        echo "Cancelled. Exiting..."; exit 0
    else
        echo "Incorrect input. Exiting..."; exit 1
    fi
}

remove_item() {
    echo "Your $type list:"
    eval "for i in \"\${!$arrayname[@]}\"; do
        echo \"\$((i+1))) \${$arrayname[i]}\"
    done"
    echo
    read -p "Which $type ID do you want to remove?: " remove_id
    eval "target_item=\${$arrayname[\$((remove_id-1))]}"
    read -p "Remove '$target_item' from your $type list? (Y/n): " remove_confirm
    remove_confirm=${remove_confirm:-Y}

    if [[ $remove_confirm =~ ^[Yy]$ ]]; then
        eval "removed_title=\${$arrayname[\$((remove_id-1))]}"
        eval "unset '$arrayname[\$((remove_id-1))]'"
        eval "printf '%s\n' \"\${$arrayname[@]}\" > \"\$$filevar\""
        echo "Title '$removed_title' was successfully removed from your $type list!"
        exit 0
    elif [[ $remove_confirm =~ ^[Nn]$ ]]; then
        echo "Cancelled. Exiting..."; exit 0
    else
        echo "Incorrect input. Exiting..."; exit 1
    fi
}

set_type() {
    case $menu2_choice in
        "1") type="anime";;
        "2") type="movie";;
        "3") type="series";;
        "4") type="cartoon";;
        "5") type="video";;
        "0") echo "See you next time!"; exit 0;;
        *) echo "Incorrect input. Exiting..."; exit 1;;
    esac
}
