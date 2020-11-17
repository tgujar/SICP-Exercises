#lang sicp
(define (cube-iter guess x)
  (if (good-enough? (improve guess x) guess)
      guess
      (cube-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))


(define (square x) (* x x))

(define (good-enough? guess last-guess)
  (< (abs (- guess last-guess)) 0.001))

(define (cubert x)
  (cube-iter 1.0 x))

