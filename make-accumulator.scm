(define (make-accumulator n)
	(lambda (acc-n)
		(begin (set! n (+ n acc-n))
			n)))

(define acc (make-accumulator 5))
(acc 10)
(acc 10)
