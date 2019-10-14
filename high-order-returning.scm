(define (avg a b)
	(/ (+ a b) 2))
(define (avg-damp f)
	(lambda (x) (avg x (f x))))

((avg-damp (lambda (x) (+ 1 x))) 2)
