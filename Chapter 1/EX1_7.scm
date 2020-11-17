#lang sicp
(define (sqrt-iter guess x)
  (if (good-enough? (improve guess x) guess)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (good-enough? guess last-guess)
  (< (abs (- guess last-guess)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))
