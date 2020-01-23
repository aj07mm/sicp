(define (integers-starting-from n)
	(cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define (stream-ref s n)
	(if (= n ))
		(stream-car s)
		(stream-ref (stream-cdr s) (- n 1)))

;(stream-car (stream-cdr integers))
(stream-ref integers 5)
