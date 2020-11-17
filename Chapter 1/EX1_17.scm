#lang sicp
(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (even? x) (= (remainder x 2) 0))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))