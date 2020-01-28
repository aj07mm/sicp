(define (string-join ls delim)
  "Join list of strings together by delim into one string."
  (define out (open-output-string))
  (for-each (lambda (delim item)
              (display delim out)
              (display item out))
            (cons "" (circular-list delim))
            ls)
  (get-output-string out))


(define (integers-starting-from n)
	(cons-stream n (integers-starting-from (+ n 1))))
;(define integers (integers-starting-from 1))
(define (divisible? x y) (= (remainder x y) 0))
(define (sieve stream)
	(display "\n")
	(display "=====")
	(display stream)
	(display "=====")
	(cons-stream
		(stream-car stream)
		(sieve (stream-filter
				(lambda (x)
					(begin
						(display "\n")
						(display (string-join (list "(not (divisible? " x " (stream-car " stream "))) - " (not (divisible? x (stream-car stream)))) " "))
						(not (divisible? x (stream-car stream))))) ; stream permanece com o valor inicial, o x muda
				(stream-cdr stream)))))

;(stream-car (sieve integers))
;(stream-car (sieve (cons-stream 1 2)))

;(define foo (cons-stream ; cons-stream faz com que stream-filter nao seja computado infinitamente
;		(stream-car stream)
;		(stream-filter
;				(lambda (x)
;					(not (divisible? x (stream-car stream))))
;				(stream-cdr stream))))

;(define bar (stream-cdr stream))
;(cons-stream (stream-car bar) (stream-cdr bar))


;(stream-car primes)
;(stream-car (stream-cdr primes))
;(stream-car (stream-cdr (stream-cdr primes)))
;(stream-car (stream-cdr (stream-cdr (stream-cdr primes))))
;(stream-car (stream-cdr (stream-cdr (stream-cdr (stream-cdr primes)))))
;(stream-ref primes 50)

(define primes (sieve (integers-starting-from 2)))
(stream-ref primes 3)
