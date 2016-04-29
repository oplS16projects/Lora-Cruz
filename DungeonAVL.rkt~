#lang racket
(require avl)

;;Creates the map for the dungeon
(define dungeon-avl
  ;;(make-avl string<=?))
  (make-custom-avl (lambda (x y) (<= (car x)(car y)))
                   (lambda (x y) (equal? (car x) (car y)))))

(avl-add! dungeon-avl (cons 1 "enemy1"))
(avl-add! dungeon-avl (cons 2 "enemy2"))
(avl-add! dungeon-avl (cons 3 "enemy3"))
(avl-add! dungeon-avl (cons 4 "enemy4"))
(avl-add! dungeon-avl (cons 5 "boss"))

(define (NextEnemy avl)
  (if (avl-empty? avl)
      'win ;;message passing
      (cdr (avl-pop-min! avl))))

