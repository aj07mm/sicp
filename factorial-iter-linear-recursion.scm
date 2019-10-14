(define (factorial n) ; linear recursive process ; linear iterative process
	(define (iter product counter)
		(if (> counter n) ; stop condition
			product
			(iter (* counter product) ; performs multply
			      (+ counter 1)))) ; increment counter
	(iter 1 1))

(factorial 4)


(define (factorial n)
	(fact-iter 1 1 n))

(define (fact-iter product counter max-count)
	(if (> counter max-count)
		product
		(fact-iter (* counter product)
				   (+ counter 1)
				   max-count)))


(factorial 4)
