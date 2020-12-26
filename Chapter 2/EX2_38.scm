#lang sicp
(define (fold-right op initial seq)
  (if (null? seq)
      initial
      (op (car seq) (fold-right op initial (cdr seq)))))

(define (fold-left op initial seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial seq))

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))
(fold-right * 1 (list 1 2 3)) ; multiplication is commutative
(fold-left * 1 (list 1 2 3))