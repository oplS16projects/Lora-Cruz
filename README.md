# Lora-Cruz

# Project Title: Dragon Hall Z

### Statement  
The basic idea is to use AVL tree/regular tree to create a dungeon crawler in which we use the image libraries to display monsters to the player,and based on the level of the tree the user is on the difficulty of the monster the player will be able to obtain more epxerience to level up and go to higher difficulties.The reason this is interesting personally is because dungeon crawlers are simple but can be difficult and entertaining at the same time.We hope to learn how to use what we have previosly learned and apply it in different ways such as using lambda to create a way to calculate accuracy, create a random number generator for player stat gain such as health,mana.

### Analysis  
We will use object orientation for the initial creation of the lower levels of the tree to control the beggining difficulty of the game and for the final boss of the game this way we can control the begging and end of the enviroment everything else is left to the player.

### Data set or other source materials
The data that we will be working on will be writen by ourselves.

### Deliverable and Demonstration
At the end we will have an interactive dungeon crawler that has the player move from level to level, and encounting monsters which they will battle with text based decisions such as fighting, running away,healing.If the are to choose fighting there are chances that they will will miss the enemy but there is a chance that the enemmy will also miss, if they win the battle they gain experience and move up ,this will repeat until they reach the boss.

-Potential changes are being able to go up and down by choice but problems with this is that we will have to randomly generate the boss with higher parameters to increase difficulty.

### Evaluation of Results

The player will start at the bottom and be able to move their way through the levels of the dungeon gaining experience from killing monsters, leveling up and eveutally reach the final boss.

## Architecture Diagram
![alt tag](http://i795.photobucket.com/albums/yy234/joel24478/Screen%20Shot%202016-04-05%20at%207.59.25%20PM_zpsoo4veaqj.png)

## Schedule

### First Milestone (Fri Apr 15)  

Traversing through the dungeon(tree)  
GUI for showing Monsters using Images library (optional)  

### First Milestone Update
The original plan for the creation of the Player and the monsters was to create them as simple objects and change but we decided to create a dispatch for both of them.The reason behind this we can make create global variables at the top and use these variables to control the monster and player.With this we can avoid use same names and know that the scope of these items is contained.We can define an item and set the return value from the dispatch to this and then we can use these new values later on to manipulate the player or monsters.

### Second Milestone (Fri Apr 22)  

Create monster objects and their parameters  
Modification of Player object with lambda functions  

### First Milestone Update
As of  current we have achieved most of our initial proposals with slight alterations.The dispatches for the enemies and and player are taking in some arbitriary value in order to see the functions working we plan on changing some of the elements within the dispatcher into setters and getters in order to make to make obtaining specific values more easily.We began the initial implimentation of the encounter window we added a simple GUI with outputs from both monsters and players displaying some of their actions so the person interacting can know what is happening.There are buttons for this simple interaction window but the functionality is simple.

### Final Presentation (last week of semester)

Aplication of Encounter options  

## Group Responsibilities
Here each group member gets a section where they, as an individual, detail what they are responsible for in this project. Each group member writes their own Responsibility section. Include the milestones and final deliverable.



### Andry Lora @andrylr
Create monster objects and their parameters  
Modification of Player object with lambda functions

### Joel Cruz @joel24478
Traversion of the Dungeon(tree)
Aplication of Encounter options




 
