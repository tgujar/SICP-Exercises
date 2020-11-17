#lang sicp

(define (square x) (* x x))
(define (sumOfSquares x y) (+ (square x) (square y)))
(define (>= x y) (not (< x y)))
(define (f x y z)
  (cond ((and (>= x y) (>= y z)) (sumOfSquares x y))
        ((and (>= x y) (>= z y)) (sumOfSquares z x))
        (else (sumOfSquares z y))
  )
)