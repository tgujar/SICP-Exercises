#lang sicp
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(subsets (list 1 2 3))

#|
The process shoots down to the empty list, at this point the variable rest gets assigned ()
This then combines the last element i.e 3 in the example with the empty list, and then appends () to the list thus created
giving us (() (3)).

As the recursing unwinds, we combine each variable in the set, with those of elements obtained from the next recursive call,
while also perserving those elements. Effectively, at each recusive call this gives us a list which contains the subsets without the element in the current
call and also with it.
|#