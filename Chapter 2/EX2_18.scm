#lang sicp
(define (reverse l)
  (define (reverse-iter og reversed)
    (if (null? (cdr og))
        (cons (car og) reversed)
        (reverse-iter (cdr og) (cons (car og) reversed))))
  (reverse-iter l nil))