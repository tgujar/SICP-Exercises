#lang sicp
(define (weighted-sum term a next b weight)
  (if (> a b)
      0
      (+ (term a)
         (weighted-sum term (next a) next b))))

(define (s-integral f a b n)
  (define (integral-iter count result)
    (define (mult count)
     (cond ((or (= count 0) (= count n)) 1)
           ((= (remainder count 2) 1) 4)
           (else 2)))
      (if (> count n)
          result
          (integral-iter (+ count 1) (+ (* (f (+ a (* count (/ (- b a) n)))) (mult count)) result))))
  (* (/ (- b a) n 3) (integral-iter 0 0)))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x) (* x x x))