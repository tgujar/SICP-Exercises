#lang sicp
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq) (accumulate op initial (cdr seq)))))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(define (fringe x)
  (cond ((null? x) nil)
        ((not (pair? x)) (list x))
        (else (append (fringe (car x))
                      (fringe (cdr x))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (length (fringe x))) t)))

;(count-leaves (list 1 (list 2 (list 3 (list 5 6) 4))))