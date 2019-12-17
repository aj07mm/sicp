(define (scale-tree tree factor)
	(cond ((null? tree) tree)
		  ((not (pair? tree)) (* tree factor))
		  (else (cons (scale-tree (car tree) factor)
				      (scale-tree (cdr tree) factor)))))

;(scale-tree '(1 (2 (3 4) 5) (6 7)) 10)
(scale-tree '(1 (2 3)) 10)
