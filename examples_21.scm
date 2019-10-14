(define (a-plus-abs-b a b)
		((if (> b 0) + -) a b))

; (a-plus-abs-b 3 4) ; 7
; (a-plus-abs-b 0 4) ; 4

(define (dec-0 n)
		(if (>= n 2) (dec-0 (- n 1)) n))

(dec-0 8)
