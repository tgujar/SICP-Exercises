#lang sicp
(define (fold-right op initial seq)
  (if (null? seq)
      initial
      (op (car seq) (fold-right op initial (cdr seq)))))

(define (fold-left op initial seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial seq))

(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))

#|(define (reverse seq)
  (fold-right (lambda (x y) (append y (list x))) nil seq))|#

(define (reverse seq)
  (fold-left (lambda (x y) (cons y x)) nil seq))

(reverse (list 1 2 3 4 5))