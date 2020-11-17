#lang sicp
(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (even? x) (= (remainder x 2) 0))

(define (fast-mult a b)
  (fast-mult-iter a b 0))

(define (fast-mult-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (fast-mult-iter (double a) (/ b 2) n))
        (else (fast-mult-iter a (- b 1) (+ a n)))))
