(define (foo x)
	(if (> x 1) 2 3))

; (foo 1)

(define (bar x)
	(cond ((= x 1) "um")
		  ((= x 2) "dois")
		  (else "resto")))

(bar 5)
