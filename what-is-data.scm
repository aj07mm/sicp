(define (cons x y)
    (define (dispatch m)
        (cond ((= m 0) x)
              ((= m 1) y)
              (else (error "Argument not 0 or 1 - CONS"))))
     dispatch)
(define (car z) (z 0))
(define (cdr z) (z 1))

;((cons 1 2) 0)
(car (cons 2 3))
