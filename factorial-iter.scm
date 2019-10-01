(define (factorial n) ; linear recursive process ; linear iterative process
	(define (iter product counter)
		(if (> counter n) ; stop condition
			product
			(iter (* counter product) ; performs multply
			      (+ counter 1)))) ; increment counter
	(iter 1 1))

(factorial 4)
