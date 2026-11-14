# GDtracker

A Godot based game randomizer item tracker
## Instructions
### 1.
    Download a pack (such as the example pack in this repo). The pack MUST at the very least have a file called items.json with an array object called items, and each item must have a "name" and a number of "levels"
     and a folder of pngs called "icons" where each png shares a name with one of the items in item.json
### 2.
    Select the folder in the window the program starts with. 
### 3
. The program will enter its board view. Here is where the program is operated. On the left is the item grid, which contains the items.json items with their respective pictures If the folder contains a map.png and a checks.json they will appear on the right side of the screen. checks.json must have an array object called "checks", each check must have a name, x and y coordinates of where they appear in the map, and a requirements array containing the names of the items (as per items.json) necessary for the check to be available
### Operation

Click the items in the item grid to mark them as acquired, hold for half a second to remove
As you unlock more items more checks will become available once their requirements are met
