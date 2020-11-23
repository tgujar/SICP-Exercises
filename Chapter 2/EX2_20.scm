#lang sicp
(define (filter f? l)
  (define (list-iter og res)
    (cond ((null? og) res)
          ((f? (car og)) (list-iter (cdr og) (append res (list (car og)))))
          (else (list-iter (cdr og) res))))
  (list-iter l nil))


(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))

(define (same-parity first . rest)
  (let ((check (remainder first 2)))
    (filter (lambda (x) (= (remainder x 2) check)) (cons first rest))))
  