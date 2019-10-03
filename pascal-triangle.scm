;;; 1
;;; 1 1
;;; 1 2 1
;;; 1 3 3 1


; (define (pascal-triangle lvl)
; 	(define (depth-pascal-triangle left right depth-lvl)
; 		(if (= depth-lvl lvl)
; 			(- right left)
; 			(depth-pascal-triangle (+ left (+ depth-lvl 1)) (+ right (+ depth-lvl 1)) 0)))
; 	(depth-pascal-triangle 1 1 1))

(define (trig n)
	(display n))


(define (pascal row column)
  (cond ((or (= row column) (= 1 column)) 1)
        (else (+ (pascal (- row 1) (- column 1))
                 (pascal (- row 1) column)))))


(pascal 0 0)
