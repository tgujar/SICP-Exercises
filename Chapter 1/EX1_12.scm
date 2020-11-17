#lang sicp
(define (pascal elem row)
  (if (or (= elem 0) (= elem row))
      1
      (+ (pascal (- elem 1) (- row 1)) (pascal elem (- row 1)))))