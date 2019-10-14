(define (cube n) (* n n n))
(define (sum-cubes a b)
	(display a)
	(if (> a b)
		0
		(+ (cube a) (sum-cubes (+ a 1) b))))

(sum-cubes 1 10)
