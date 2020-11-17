#lang sicp
;recursive process
(define (cont-frac n d k)
  (define (frac-step k max)
    (if (= k max)
        (/ (n k) (d k))
        (/ (n k) (+ (d k) (frac-step (+ k 1) max)))))
  (frac-step 1 k))
;iterative process
#|(define (cont-frac n d k)
  (define (frac-iter count result)
    (if (= count 0)
        result
        (frac-iter (- count 1) (/ (n count) (+ (d count) result)))))
  (frac-iter k 0))|#

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)