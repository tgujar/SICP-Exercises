#lang sicp
(define (make-interval a b) (cons a b))
(define (upper-bound z) (max (car z) (cdr z)))
(define (lower-bound z) (min (car z) (cdr z)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (let ((p1 (upper-bound y))
        (p2 (lower-bound x))
        (p3 (upper-bound x))
        (p4 (lower-bound y)))
    (make-interval (- p2 p1)
                   (- p3 p4))))

(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ly (lower-bound y))
        (ux (upper-bound x))
        (uy (upper-bound y)))
    (cond ((and (< lx 0) (> ly 0) (> ux 0) (> uy 0)) (make-interval (* lx uy) (* ux uy))) ;; [- +]*[+ +]
          ((and (> lx 0) (< ly 0) (> ux 0) (> uy 0)) (make-interval (* ly ux) (* ux uy))) ;; [+ +]*[- +]
          ((and (< lx 0) (< ly 0) (< ux 0) (< uy 0)) (make-interval (* ux uy) (* lx ly))) ;; [- -]*[- -]
          ((and (> lx 0) (> ly 0) (> ux 0) (> uy 0)) (make-interval (* lx ly) (* ux uy))) ;; [+ +]*[+ +]
          ((and (> lx 0) (< ly 0) (> ux 0) (< uy 0)) (make-interval (* ux ly) (* lx uy))) ;; [+ +]*[- -]
          ((and (< lx 0) (> ly 0) (< ux 0) (> uy 0)) (make-interval (* lx uy) (* ux ly))) ;; [- -]*[+ +]
          ((and (< lx 0) (< ly 0) (> ux 0) (< uy 0)) (make-interval (* ux ly) (* ly lx))) ;; [- +]*[- -]
          ((and (< lx 0) (< ly 0) (< ux 0) (> uy 0)) (make-interval (* uy lx) (* lx ly))) ;; [- -]*[- +]
          ((and (< lx 0) (< ly 0) (> ux 0) (> uy 0)) (make-interval (min (* uy lx) (* ux ly)) ;; [- +]*[- +]
                                                                    (max (* ux uy) (* lx ly))))
          )))

(define (div-interval x y)
  (if (or (= (lower-bound y) 0) (= (upper-bound y) 0))
      (error "Divison by zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c percent)
  (make-center-width c (/ (* percent c) 100)))

(define (percent z)
  (* (/ (width z) (center z)) 100.0))

;; (define a (make-center-percent 4 1))
;; (percent (div-interval a a))
;; (define one (make-interval 1 1))