#lang sicp
(define (square x) (* x x))
(define (exp a n)
  (cond ((= n 0) 1) 
        ((= (remainder n 2) 0) (square (exp a (/ n 2))))
        (else (* a (exp a (- n 1))))))
(define (find-exponent a n)
  (define (iter a n count)
    (if (and (= (remainder a n) 0) (not (= a 0)))
        (iter (/ a n) n (+ count 1))
        count))
  (iter a n 0))
  
(define (cons a b) (* (exp 2 a) (exp 3 b)))
(define (car z) (find-exponent z 2))

(define (cdr z) (find-exponent z 3))