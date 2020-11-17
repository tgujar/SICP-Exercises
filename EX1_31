#lang sicp
#|(define (product term a next b )
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))|#

(define (product term a next b)
  (define (prod-iter a result)
    (if (> a b)
        result
        (prod-iter (next a) (* (term a) result))))
  (prod-iter a 1))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n)
  (product identity 1 inc n))

(define (pi acc)
  (define (even-terms a) (* a (+ a 2)))
  (define (odd-terms a) (* a a))
  (define (next a) (+ a 2))
  (* (/ (product even-terms 2 next acc) (product odd-terms 3 next (+ acc 2))) 1.0))