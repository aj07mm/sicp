(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))
(define (empty-queue? queue) (null? (front-ptr queue)))
(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))

;1 ]=> (cons (cons 'a '()) (cons 'a '()))
;Value 13: ((a) a)
;1 ]=> (cons (cons 'a '()) 'a)
;Value 16: ((a) . a)

(define q1 (make-queue))
(define q1 (cons (cons 'a '()) (cons 'a '()))) ; functional
; doesn't work because there is no pointer to a environment frame
(define q2 (make-queue))
(insert-queue! q2 'a) ; non-funcional
(define a (cons 'a '()))
(define q3 (cons a a)) ; non-functional
;(insert-queue! q1 'a)
;(insert-queue! q1 'b)
;(insert-queue! q1 'c)
;(insert-queue! q1 'd)
(define (foo queue item)
	(define new-pair (cons item '()))
	(set-cdr! (rear-ptr queue) new-pair)
	(set-rear-ptr! queue new-pair)
	queue)

(foo q1 'b)
(foo q2 'b)
(foo q3 'b)
