#lang sicp
(define (square-tree tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree subtree)
             (* subtree subtree)))
       tree))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(square-tree tree)