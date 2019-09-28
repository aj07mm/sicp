(define (foo x)
	(define (bar) (+ x 5))
	(bar))
(foo 2)
