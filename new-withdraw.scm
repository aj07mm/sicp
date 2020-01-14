(define new-withdraw
	(let ((balance 100))
		(lambda (amount)
			(if (>= balance amount)
				; need this, can't do without set!
				(begin (set! balance (- balance amount))
					balance)
				"Insufficient funds!"))))

(new-withdraw 90)
(new-withdraw 20)
