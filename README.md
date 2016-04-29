##Title:Dungeon Hall Z
##Authors
### Andry Lora @andrylr
### Joel Cruz @joel24478


##Overview
There a several buttons which are used to act within the enviroment that were created using the gui library.There are monsters that the player fights and come out victorious or a loser based on how lucky they really are.

##Screenshot
Here's a demonstration of how to display an image that's uploaded to this repo:
![screenshot showing env diagram](https://github.com/oplS16projects/Lora-Cruz/blob/master/Screen%20Shot%202016-04-29%20at%2011.23.52%20AM.png)

##Concepts Demonstrated

* **Object oriented**:We used dispatch and within the dispatch are all the functions that pertain to that object
* **Getter and Setter methods**:This was an important piece to the puzzle to get the data that was only within the scope
of the dispatch to the outside.
* **Higher Order Procedures** There were multiple uses of callbacks within this project which were connected to button presses.

##External Technology and Libraries

* [GUI Library](https://docs.racket-lang.org/gui/):We used the GUI library to create a window which had a text window for displaying our data to the user in a white box
that was a white color different than the background.We assigned functionality to the buttons within the simple interface to change 
the values of the objects.

* [AVL Tree](https://docs.racket-lang.org/avl/index.html): The AVL library was used to place monsters that were created in project.rkt. We feed it monsters and it spits them out in the order they were placed in, so basic monsters first then the Boss monster. 

##Favorite Scheme Expressions
####Andry 
This is my favorite segment.What it does it it creates a button which has a callback function that takes other function and calls them.The reason why it is my favorite is not because it has complexity but because of how the elements combine nicely within the callback function.I did not understand callback functions at all but I understand them better know "They are functions that are called when something happens" in this project it was button presses.
```scheme
(define battle (new horizontal-panel% [parent frame]))

(new button% [parent battle]
             [label "Attack"]
             [min-width 130]
             [min-height 100]
             [callback (lambda (b e) (clear-text)    
                         (monster-clear-text)
                         (define monster-damage-done (monster 'attack))
                         (define player-damage-done (Player1 'attack))  
                         (define monster-damage-taken ((monster 'attacked) player-damage-done))
                         (define player-damage-taken ((Player1 'attacked) monster-damage-done))
                         (define player-HP (Player1 'getHealth))
                         (define monster-HP (monster 'getHealth))
                         (cond ((< player-HP 0)(send editor insert player-dead))
                               ((< monster-HP 0)(send editor insert monster-dead))
                               (else(nextPhase player-HP monster-HP player-damage-done monster-damage-done)))
                         )])
                 
```
####Joel
This was my favorite snippit of code because I had fun writing the players special move. What is does is run a callback function when the button is clicked. It grabs chuncks of information about the player and monster, and displays it in the appropriate text fields on our gui.
```scheme
(new button% [parent battle]
     [label "Special"]
     [min-width 100]
     [min-height 100]
     [callback (lambda (b e) (clear-text)
                 (monster-clear-text)
                 (define special-use (Player1 'special))
                 (define special-output
                   (if (number? special-use);;if its a number then it means we can attack
                       (special-goes-off 500)
                       (string-append "Players HP: " (->string (Player1 'getHealth)) (->string special-use)))) ;;else we got the string "Cant use special yet!"
                 (send editor insert special-output)
                 (if (< (monster 'getHealth) 0)
                     (send monster-editor insert (monster-dead))
                     (send monster-editor insert (string-append (monster-attack-output (monster 'getHealth) (monster 'attack)))))
                       )])
```

#How to Download and Run
* Download the .zip
* extract
* open project.rkt with racket
* click run at the top right

When running you can click on the buttons labled with the specific actions to be performed and the output of your actions will be displayed.The attack numbers are randomly generated so when you fight against the monster you can kill them instantly or they can do the same to you.Is RNG on your side?
