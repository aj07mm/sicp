(define (fib n) ; tree recursion
	(cond ((= n 0) 0)
		  ((= n 1) 1)
		  (else (+ (fib (- n 1))
		           (fib (- n 2))))))

(define (fib n ) ; linear iterative process
	(if (= count 0)
		b
		(fib-iter (+ a b) a (- count 1))))

(fib 5)
