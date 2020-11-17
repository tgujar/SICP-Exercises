#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (exp x n)
  (if (> n 0)
      (* x (exp x (- n 1)))
      1))
(define (average a b) (/ (+ a b) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (nth-root x n)
  (fixed-point ((repeated average-damp (floor (/ (log n) (log 2)))) (lambda (y) (/ x (exp y (- n 1))))) 1.0))
  
