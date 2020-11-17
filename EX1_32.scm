#lang sicp
#|(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))|#

(define (accumulate combiner null-value term a next b)
  (define (acc-iter a result)
    (if (> a b)
        result
        (acc-iter (next a) (combiner (term a) result))))
  (acc-iter a null-value))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n)
  (accumulate * 1 identity 1 inc n))

(define (sum-integers a b)
  (accumulate + 0 identity a inc b))