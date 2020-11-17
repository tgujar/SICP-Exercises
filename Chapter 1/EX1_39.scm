#lang sicp
(define (cont-frac n d k)
  (define (frac-step k max)
    (if (= k max)
        (/ (n k) (d k))
        (/ (n k) (+ (d k) (frac-step (+ k 1) max)))))
  (frac-step 1 k))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i) (- (* 2 i) 1))
             k))