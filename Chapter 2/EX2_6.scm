#lang sicp
(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(define (plus a b) (lambda (f) (lambda (x) ((b f) ((a f) x)))))

; procedure evaluation
#|
(+ one two)
(lambda (f) (lambda (x) ((two f) ((one f) x))))
(lambda (f) (lambda (x) ((two f) (f x))))
(lambda (f) (lambda (x) (f (f (f x)))))
|#

; the number of times "f"  is called denotes the integer

; to check if the program is correct
#|
(define (f a) (+ a 1)) ; "f" increments the formal param
((zero f) 0) ; => 0
(((add-1 (plus one two)) f) 0) ; => 4
|#