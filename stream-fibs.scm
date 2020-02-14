(define (add-streams s1 s2)
	(stream-map + s1 s2))

(define fibs
	(cons-stream 0
		(cons-stream 1
			(add-streams (stream-cdr fibs)
							fibs))))

(stream-car fibs)
(stream-car (stream-cdr fibs))
(stream-car (stream-cdr (stream-cdr fibs)))
(stream-car (stream-cdr (stream-cdr (stream-cdr fibs))))
