(load "ch2.2.3.scm")
(use-modules (ice-9 debug))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append `() (map proc seq)))

(define (remove seq x)
  (if (= (car seq) x)
    (cdr seq)
    (cons (car seq) (remove (cdr seq) x))))

(define (permutations s)
  (if (null? s)
    (list `())
    (flatmap (lambda (x)
	       (map (lambda (p) (cons x p))
		    (permutations (remove s x))))
	     s)))

(permutations `(1 2 3))
