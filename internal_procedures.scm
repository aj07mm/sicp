(define (sqrt x)
	(define (plus-1 x) (+ x 1))
	(plus-1 (* x x))
)

(sqrt 2)
