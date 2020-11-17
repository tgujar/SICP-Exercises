#lang sicp
(define (square x) (* x x))
(define (average a b) (/ (+ a b) 2))

;; Segment lib
(define (make-segment x y) (cons x y))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))
(define (length-segment x)
  (distance-points (start-segment x) (end-segment x)))
(define (midpoint-segment x)
  (let ((x1 (x-point (start-segment x)))
        (x2 (x-point (end-segment x)))
        (y1 (y-point (start-segment x)))
        (y2 (y-point (end-segment x))))
    (make-point (average x1 x2) (average y1 y2))))

;; Point lib
(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point x) (cdr x))
(define (distance-points a b)
  (sqrt (+
         (square (- (x-point a) (x-point b)))
         (square (- (y-point a) (y-point b))))))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Implementation 1
#|(define (make-rectangle p1 p2) (cons p1 p2))
(define (top-left r) (car r))
(define (bottom-right r) (cdr r))
(define (width-rectangle r)
  (abs (- (x-point (top-left r)) (x-point (bottom-right r)))))
(define (height-rectangle r)
  (abs (- (y-point (top-left r)) (y-point (bottom-right r)))))|#

; Implementation 2
(define (make-rectangle side perpendicular-side) (cons side perpendicular-side))
(define (width-rectangle r) (length-segment (car r)))
(define (height-rectangle r) (length-segment (cdr r)))

;; Implementation for area and perimeter
(define (area-rectangle r)
  (* (width-rectangle r) (height-rectangle r)))
(define (perimeter-rectangle r)
  (* 2 (+ (width-rectangle r) (height-rectangle r))))