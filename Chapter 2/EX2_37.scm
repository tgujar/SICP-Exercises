#lang sicp
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq) (accumulate op initial (cdr seq)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose m)
  (accumulate-n cons nil m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

;(define v (list 1 2 3 4))
;(define m (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))
;(dot-product v v) ; 30
;(matrix-*-vector m v) ; (30 70 110)
;(transpose m) ; ((1 5 9) (2 6 10) (3 7 11) (4 8 12))
;(matrix-*-matrix m m)