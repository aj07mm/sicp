(define (foo fn x)
	(fn x))

(foo (lambda (x) (+ x 2)) 3)
