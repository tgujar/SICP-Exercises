#lang sicp
(define (filter-accumulate combiner null-value filter? term a next b)
  (define (acc-iter a result)
    (cond ((> a b) result)
          ((filter? a) (acc-iter (next a) (combiner (term a) result)))
          (else (acc-iter (next a) result))))
  (acc-iter a null-value))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (define (next test-divisor)
    (if (= test-divisor 2)
        3
        (+ test-divisor 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (and (= n (smallest-divisor n)) (> n 1)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; part a
(define (square x) (* x x))
(define (sum-of-primes a b)
  (filter-accumulate + 0 prime? square a inc b))

; part b
(define (identity x) x)
(define (product-of-rprimes n)
  (define (relatively-prime? a)
   (= (gcd n a) 1))
  (filter-accumulate * 1 relatively-prime? identity 1 inc n))