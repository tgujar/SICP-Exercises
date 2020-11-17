#lang sicp
(define (square x) (* x x))
(define (non-trivial-sqrt base exp m)
  (define num (expmod base (/ exp 2) m))
  (if (and (not (or (= num 1) (= num (- m 1)))) (= (remainder (square num) m) 1))
       0
       (remainder (square num) m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (non-trivial-sqrt base exp m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))
  
(define (miller-rabin-test n)
  (define (try-it a)
    (not (= (expmod a (- n 1) n) 0)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

