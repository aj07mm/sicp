(define (make-account balance password)
  (define counter 0)
  (define (withdraw amount)
    (if (< balance amount)
        (error "no enough balance")
        (begin (set! balance (- balance amount))
               balance)))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch pass arg)
    (if (eq? pass password)
        (begin (set! counter 0)
               (cond
                ((eq? arg 'withdraw) withdraw)
                ((eq? arg 'deposit) deposit)
                (else (error "requested procedure does not exist"))))
        (begin (set! counter (+ counter 1))
               (if (>= counter 7)
                   (error "calling the cops")
                   (error "wrong password")))))
  dispatch)
