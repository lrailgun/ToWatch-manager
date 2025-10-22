# ToWatch-manager

**ToWatch-manager** is a simple Bash script to manage your watchlists for anime, movies, series, cartoons, and videos.  
It allows you to add new titles, remove existing ones, and browse your current lists.

> ⚠️ Note: I am still learning programming, so this project is a work in progress.

---

## Features

- Add new titles to your watchlists
- Remove existing titles
- Browse all lists

---

## Installation & Usage

1. Clone the repository:
`git clone https://github.com/lrailgun/ToWatch-manager.git
cd ToWatch-manager`

2. Make the main script executable:
`chmod +x watchlist.sh`

3. Run the script:
`./watchlist.sh`

File Structure

- watchlist.sh — main script
- watchlist_functions.sh — file with functions
- *.txt — files storing watchlists (anime.txt, movies.txt, etc.)

Usage Example

After running the script, you will see the main menu:

1. Add new title
2. Remove existing title
3. Browse lists
0. Exit


Selecting an option will trigger the corresponding action. For example:

- Add a title → prompts for type, name, and URL
- Remove a title → prompts for type and ID
- Browse → displays your current list with numbered entries
