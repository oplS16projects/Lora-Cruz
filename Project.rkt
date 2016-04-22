#lang racket

(define PlayerHp 100)
(define StarterMonsterHp (random 25))
(define BossHp 1000)


 ;;Creation of Player
(define (Player health potions mana)
  ;defining miss chance

  ;Damage taken after attacking
  (define (attack health)
    (define miss (random 100))
    (if ( >= miss 30)
        (if (>= health 0)
        (begin (set! health (- health (random 15)))
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
          
         ;;Gave an error because dispatch requires an else
          (else (error "Not a Command"
                       m))))
  ; return the dispatch
  dispatch)



;;Creation of Monsters
(define (Monster health)
  ;Damage taken after attacking
  (define (attack health)
    (define miss (random 100))
    (if ( >= miss 60)
        (if (>= health 0)
        (begin (set! health (- health (random 30)))
               health)
        "You are Dead")
        "You Missed"))

  (define (dispatch m)
    (cond ((eq? m 'attack) attack)
       ;;Gave an error because dispatch requires an else
          (else (error "Not a Command"
                       m))))
  ; return the dispatch
  dispatch)

;;manipulate these when moving up and down the tree

;;If Tree level is lowest create player
(define Player1 (Player PlayerHp 5 100))

;;Store New Hp for reuse
(define StoredHp 0)
(if (number? ((Player1 'attack)100))
(set! StoredHp((Player1 'attack)100))
"Needs a Number")


;;Each time a new tree Level is hit create a monster
(define monster (Monster  StarterMonsterHp))

;;After Initial use of (define Player1 (Player PlayerHp 5 100)) we use StoreHp to continue on
;;Need to find a way to redefine previous elements for reuse
(define Player2 (Player StoredHp 5 100))

;;Top level of Tree Create Boss
(define BOSS (Monster BossHp))



