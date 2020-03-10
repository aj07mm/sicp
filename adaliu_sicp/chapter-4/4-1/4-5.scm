(define (cond-package-install)
  (define (=>clause? clause)
    (eq? (cadr clause) '=>))
  (define (cond-predicate clause)
    (car clause))
  (define (cond-actions clause)
    (if (=>clause? clause)
        (cddr clause)
        (cdr clause)))
  (define (cond-else-clause? clause)
    (eq? (cons-predicate clause) 'else))
  (define (cond->if clauses) (expand-clauses clauses))
  (define (expand-clauses clauses)
    (if (null? clauses)
        'false
        (let ((first (car clauses))
              (rest (cdr clauses)))
          (if (cond-else-clause? first)
              (if (null? rest)
                  (sequence->exp (cons-actions first))
                  (error "ELSE clause isn't last: COND->IF" clauses))
              (make-if (cond-predicate first)
                       (if (=>clause? first)
                           (make-call (sequence->exp (cond-actions first)) (cond-predicate first))
                           (sequence->exp (cond-actions first)))
                       (expand-clauses rest))))))
  (define (eval-self exp env)
    (eval (cons->if exp) env))
  (define (tag x) (attach-tag 'cond x))
  (put 'cond 'eval eval-self))
