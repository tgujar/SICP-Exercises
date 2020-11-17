#lang sicp
(define (square x) (* x x))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next-odd n)
    (if (= (remainder n 2) 0)
        (+ n 1)
        (+ n 2)))

(define (search-for-primes start end)
  (define next-num (next-odd start))
  (cond ((< next-num end)
       (timed-prime-test next-num)
       (search-for-primes next-num end))))