#lang sicp
(define (cont-frac n d k)
  (define (frac-step k max)
    (if (= k max)
        (/ (n k) (d k))
        (/ (n k) (+ (d k) (frac-step (+ k 1) max)))))
  (frac-step 1 k))

(cont-frac (lambda (i) 1.0)
           (lambda (i)
             (if (= (remainder (+ i 1) 3) 0)
                 (* 2.0 (/ (+ i 1) 3))
                 1.0))
           20)