; ((1 2) 3 4) ; 4
; (((1 2) 3 4) ((1 2) 3 4)) ; 8

(define (count-leaves tree)
	(cond ((null? tree) 0) ; final cdr
		  ((not (pair? tree)) 1) ; the car value of a pair
		  (else (+ (count-leaves (car tree))
		           (count-leaves (cdr tree))))))


(count-leaves (list 1 2 3))
(count-leaves '(((1 2) 3 4) ((1 2) 3 4)))
