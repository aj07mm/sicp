(define (divisible? x y) (= (remainder x 1) 0))
(define (sieve lst)
	(display "----")
	(if (pair? lst)
		(cons
			(car lst)
			(sieve (filter
					(lambda (x) (begin (display lst) #t))
					(cdr lst))))))

(sieve (list 1 2 3 4))
