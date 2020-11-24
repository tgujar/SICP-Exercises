#lang sicp
(define (deep-reverse l)
  (define (reverse-iter og reversed)
    (cond ((null? og) reversed)
          ((pair? (car og)) (reverse-iter (cdr og)
                                          (cons (deep-reverse
                                                          (car og))
                                                         reversed)))
          (else (reverse-iter (cdr og) (cons (car og) reversed)))))
  (reverse-iter l nil))