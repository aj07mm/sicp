(define (foo fn n)
	 (fn n))

; (foo (lambda (x) (* x x x)) 3)

((lambda (x) (* x x x)) 3)
