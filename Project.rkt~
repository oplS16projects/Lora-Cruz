#lang racket/gui

(define PlayerHp 100)
(define StarterMonsterHp (random 25))
(define BossHp 1000)

(define frame (new frame% [label "Welcome to Dungeon Hall Z"]
                   [min-width 200]
                   [min-height 150]
                   ))
(define my-font (make-object font% 12 'modern))
(define text (new text-field%
                  [label ""]
                  [min-height 50]
                  [min-width 258]
                  [parent frame]
                  [font my-font]
                  [enabled #f]))


(define monster-font (make-object font% 12 'modern))
(define monster-text (new text-field%
                  [label ""]
                  [min-height 50]
                  [min-width 258]
                  [parent frame]
                  [font my-font]
                  [enabled #f]))


(define editor (send text get-editor))
(define monster-editor (send  monster-text get-editor))

(define (clear-text)
  (send editor delete 0 (string-length (send editor get-text))))

(define (monster-clear-text)
  (send monster-editor delete 0 (string-length (send monster-editor get-text))))
 
 

 
 
 
(send editor set-padding
      225 ;left padding
      0 ;top padding
      0 ;right padding
      0 ;bottom padding
      )

(send monster-editor set-padding
      225 ;left padding
      0 ;top padding
      0 ;right padding
      0 ;bottom padding
      )
 

(define msg (new message% [parent frame]
                          [label ""]))


  



(define battle (new horizontal-panel% [parent frame]))
(new button% [parent battle]
             [label "Attack"]
             [min-width 100]
             [min-height 100]
             [callback (lambda (b e) (clear-text)
                         (monster-clear-text)
                             (define damage-done (->string ((Player1 'attack)1)))
                             (define attack-output(string-append "You attacked for: "  damage-done " damage" ))
                         (define monster-damage-done (->string ((monster 'attack)100)))
                         (define monster-attack-output(string-append "Monster attacked for: "  monster-damage-done " damage" ))
                             (send editor insert attack-output)
                         (send monster-editor insert  monster-damage-done))])
                 

(new button% [parent battle]
             [label "Heal"]
             [min-width 100]
             [min-height 100]

 [callback (lambda (b e) (clear-text)
             (monster-clear-text)
                             (define healing-done (->string ((Player1 'heal)100)))
                             (define healing-output(string-append  "You healed for: "  "20" " Health"))
              (define monster-damage-done (->string ((monster 'attack)100)))
                         (define monster-attack-output(string-append "Monster attacked for: "  monster-damage-done " damage" ))
                             (send editor insert healing-output)
             (send monster-editor insert  monster-damage-done))])
                 



             
             
(new button%
             [parent battle]
             [label "Run"]
             [min-width 100]
             [min-height 100]
            [callback (lambda (b e) (clear-text)
                        (monster-clear-text)
                             (define potions-left (->string ((Player1 'run)100)))
                             (define potion-output (string-append  "You lost: "  "1" " potion while running away"))
                         (define monster-damage-done (->string ((monster 'attack)100)))
                         (define monster-attack-output(string-append "Monster attacked for: "  monster-damage-done " damage" ))
                        (send editor insert potion-output)
                        (send monster-editor insert  monster-damage-done))])






(new button% [parent battle]
             [label "Special"]
             [min-width 100]
             [min-height 100]
            [callback (lambda (b e) (clear-text)
                        (monster-clear-text)
                             (define special-use (->string ((Player1 'special)100)))
                             (define special-output (string-append  "Special: " special-use))
                         (define monster-damage-done (->string ((monster 'attack)100)))
                         (define monster-attack-output(string-append "Monster attacked for: "  monster-damage-done " damage" ))
                             (send editor insert special-output)
                        (send monster-editor insert  monster-damage-done))])





(send frame show #t)


 ;;Creation of Player
(define (Player health potions mana)
  ;defining miss chance
  (define special-counter 0)
  
  (define special special-counter) 
   (if (= special-counter 3)
       ;;remove monster / damage boss to half
        (begin (set! special-counter (- special-counter 3))
               special-counter)
        "Cant use special yet!")

  ;Damage taken after attacking
  ;;change to monster health instead of player
  (define (attack health)
    (define miss (random 100))
    (if ( >= miss 30)
        (if (>= health 0)
        (begin
          (+ special 1)
          (set! health (- health (random 15)))
               health)
        "You are Dead")
        "Player Missed"))
  ;Healing
  (define (heal health potion)
    (if(> potion 0)
    (set! health (+ health 20))
    health)"You Cannot Heal")
  ;Also Called when healing
  (define (potionuse potion)
   (if (> potion 0)
        (begin (set! potion (- potion 1))
               potion)
        "No More Potions"))
  ;When you run Away you 
  (define (run potion)
    (define drop (random 100))
    (if ( >= drop 80)
        (if (> potion 0)
        (begin (set! potion (- potion 1))
               potion)
        "You Stumbled as you ran")
        "You got Away Safely"))
 
  (define (dispatch m)
    (cond ((eq? m 'attack) attack)
          ((eq? m 'heal) heal potionuse)
          ((eq? m 'run) run)
          ((eq? m 'special) special)
          
         ;;Gave an error because dispatch requires an else
          (else (error "Not a Command"
                       m))))
  ; return the dispatch
  dispatch)



;;Creation of Monsters
(define (Monster health)
  ;Damage taken after attacking
  ;;change to player health instead of monster
  (define (attack health)
    (define miss (random 100))
    (if ( >= miss 60)
        (if (>= health 0)
        (begin (set! health (- health (random 30)))
               health)
        "Monster is dead")
        "Monster Missed"))

  (define (dispatch m)
    (cond ((eq? m 'attack) attack)
       ;;Gave an error because dispatch requires an else
          (else (error "Not a Command"
                       m))))
  ; return the dispatch
  dispatch)

;;manipulate these when moving up and down the tree

;;If Tree level is lowest create player
(define Player1 (Player PlayerHp 0 100))

;;Store New Hp for reuse
(define StoredHp 0)
(if (number? ((Player1 'attack)100))
(set! StoredHp((Player1 'attack)100))
"Needs a Number")


;;Each time a new tree Level is hit create a monster
(define monster (Monster  StarterMonsterHp))

;;Top level of Tree Create Boss
(define BOSS (Monster BossHp))


;;turns into a string
;;credit to http://stackoverflow.com/questions/13313815/scheme-convert-boolean-to-string
(define (->string x)
  (call-with-output-string
   (lambda (out)
     (display x out))))








;;(define damage-done (->string ((Player1 'attack)100)))



;;Monster will always attack except when you run
(define monster-damage-done (->string ((monster 'attack)100)))
(define monster-attack-output(string-append "Monster attacked for: "  monster-damage-done " damage" ))







