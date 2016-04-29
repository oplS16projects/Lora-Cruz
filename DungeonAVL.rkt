#lang racket
(require avl)

(provide nextEnemy)
(provide addEnemy)

;;number of enemies in a dungeon
(define ENEMIES 0)
;;Creates the map for the dungeon
(define dungeon-avl
  ;;(make-avl string<=?))
  (make-custom-avl (lambda (x y) (<= (car x)(car y)))
                   (lambda (x y) (equal? (car x) (car y)))))

;;(avl-add! dungeon-avl (cons 1 "enemy1"))
;;(avl-add! dungeon-avl (cons 2 "enemy2"))
;;(avl-add! dungeon-avl (cons 3 "enemy3"))
;;(avl-add! dungeon-avl (cons 4 "enemy4"))
;;(avl-add! dungeon-avl (cons 5 "boss"))

(define (nextEnemy)
  (if (avl-empty? dungeon-avl)
      'win ;;message passing
      (cdr (avl-pop-min! dungeon-avl))))

(define (addEnemy enemy)
  (avl-add! dungeon-avl (cons ENEMIES enemy))
  (set! ENEMIES (+ ENEMIES 1))
  enemy)