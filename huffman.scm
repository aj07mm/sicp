;; huffman encoding tree

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x)
  (cadr x))

(define (weight-leaf x)
  (caddr x))

(define (symbols-tree x)
  (caddr x))

(define (weight-tree x)
  (cadddr x))


(define (make-code-tree left right)
  (list left right
        (append (symbols left)(symbols right))
        (+ (weight left)(weight right))))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (symbols-tree tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (weight-tree tree)))

(define (decode bits tree)
  (let rec ((bits bits)(current-branch tree))
    (if (null? bits)
        '()
        (let ((next-branch (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (rec (cdr bits) tree))
              (rec (cdr bits) next-branch))))))

(define (choose-branch bit branch)
  (cond ((zero? bit)(left-branch branch))
        ((= bit 1)(right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set)(list x))
        ((< (weight x)(weight (car set)))(cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)(cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (contain? branch)
    (and (find (pa$ eq? symbol)(symbols branch))
         branch))
  (let rec ((tree tree)(acc '()))
    (receive (branch bit)
        (cond ((contain? (left-branch tree)) => (cut values <> 0))
              ((contain? (right-branch tree)) => (cut values <> 1))
              (else (error "symbol not found : " symbol)))
      (let1 acc (cons bit acc)
        (if (leaf? branch)
            (reverse acc)
            (rec branch acc))))))



;;
;; test
;;

(make-leaf-set '((A 4)(B 2)(C 1)(D 1)))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)

;(let1 r (encode (decode sample-message sample-tree) sample-tree)
;  (print r)
;  (equal? r sample-message))
