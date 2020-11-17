#lang sicp
(define (fast-expt b n)
  (fast-exp-iter b n 1))

(define (square x) (* x x))

(define (even? n) (= (remainder n 2) 0))

(define (fast-exp-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-exp-iter (* b b) (/ n 2) a))
        (else (fast-exp-iter b (- n 1) (* a b)))))