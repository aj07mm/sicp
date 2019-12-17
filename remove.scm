(define (remove item sequence)
	(filter (lambda (x) (not (= x item))) sequence))

(remove 4 '(1 2 3 4 5 6 7 9))
