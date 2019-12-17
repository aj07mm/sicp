;(define (test-if n)
	;(if (= n 1) 2)
	;(if (= n 2) 3))

(define (test-if n)
	(if (= n 1)
		2
		(if (= n 2)
			3)))

; (test-if 1)
; (test-if 2)

(define (test-cond n)
	(cond ((= n 1) 2)
		  ((= n 2) 3)
		  (else 0)))

(test-cond 1)
(test-cond 2)
