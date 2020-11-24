#lang sicp
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cadr branch))

(define (branch-weight branch)
  (let ((struct (branch-structure branch)))
    (if (pair? struct)
        (total-weight struct)
        struct)))
  

(define (total-weight mobile)
   (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))


(define (balanced? mobile)
  (= (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))


; (define a(make-mobile (make-branch 5 (make-mobile (make-branch 2 2) (make-branch 2 3))) (make-branch 2 4)))
; (total-weight a)
