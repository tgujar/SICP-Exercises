#lang sicp
(define (square x) (* x x))
#|(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))|#
(define (fast-expt b n)
  (fast-exp-iter b n 1))

(define (even? n) (= (remainder n 2) 0))

(define (fast-exp-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-exp-iter (* b b) (/ n 2) a))
        (else (fast-exp-iter b (- n 1) (* a b)))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define num (random (- n 1)))
  ;(display " ")
  ;(display num)
  (try-it (+ 1 num)))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
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