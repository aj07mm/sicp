;(define (foo n)
;	(let (a 1) (b 2)))

(define (foo x)
	(let ((a 54)) ; definition
		(+ a x))) ; body

(foo 2)

(define (bar x)
	(+ 1 (let ((b 3))
		(+ b x))))

(bar 4)

;;; (define (xyz x)
;;; 	(let ((a 2)
;;; 	      (b (+ a 3))) ; can't assume a value
;;; 		 (+ b a x)))
;;;
;;; (xyz 4) ; 5 + 2 + 4
