(define (len items)
	(define (len-iter a count)
		(if (null? a)
			count
			(len-iter (cdr a) (+ 1 count))))
	(len-iter items 0))

(define (len x)
	(display x)
	(if (null? (cdr x))
		1
		(+ 1 (len (cdr x)))))

(len (list 1 2 3 4))
