#lang sicp
(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          next
          (iter next))))
  (lambda (x) (iter x)))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  ((iterative-improve (lambda (x y) (< (abs (- x y)) tolerance)) f) first-guess))

(define (average x y) (/ (+ x y) 2))
(define (sqrt x)
  ((iterative-improve (lambda (x y) (< (abs (- x y)) tolerance))
                      (lambda (k) (average k (/ x k)))) 1.0))