#lang racket
; 1. Evaluation d'expressions
(/ 12 3) ; -> 4
(- (+ 2 5 3) (* 8 4)) ; -> -22
(> (+ 2 3) 4) ; -> #t
(or #t (< 12 3)) ; -> #t
(define toto 5)
(number? toto) ; -> #t
(number? 'toto) ; -> #f
(integer? 3.5) ; -> #f
(even? (/ 6 2)) ; -> #f

; 3. Evaluation d'expressions sur les listes
;(car (1 2 3 4)) ; -> error
(car '(1 2 3 4)) ; -> 1
(cdr '(1 2 3 4)) ; -> '(2 3 4)
(cadr '(1 2 3 4)) ; -> 2
(cdddr '(1 2 3 4)) ; -> '(4)
;(cdadr '(1 2 3 4)) ; -> error
(cdadr '(1 (2 3) 4)) ; -> '(3)
(car '((1 (2 3) 4))) ; -> '(1 (2 3) 4)
(cons 1 '(2 3 4)) ; -> '(1 2 3 4)
;(cons (1) '(2 3 4)) ; -> error
(cons '1 '(2 3 4)) ; -> '(1 2 3 4)
(cons 'a '(* 3 2)) ; -> '(a * 3 2)
(cons 'a (* 3 2)) ; -> '(a . 6)
(list? (+ 2 3)) ; -> #f
(cons (cadr '(a b c)) (cdar '((d e)))) ; -> '(b e)

; 4. Exercices sur les listes
; Construire les expressions en commentaire utilisant (CONS)
(cons 'paon (cons (cons 'poule '()) '())) ; -> '(paon (poule))
(cons '() (cons '() (cons 'poule '()))) ; -> '(() () poule)
(cons 'oie (cons 'poule (cons (cons 'poule '()) (cons 'paon '())))) ; -> '(oie poule (poule) paon)
(cons 'poule (cons 'oie (cons 'poule (cons (cons (cons 'poulet '()) '()) '())))) ; -> '(poule oie poule ((poulet)))
(cons (cons (cons 'poule '()) (cons 'oie '())) (cons 'paon '())) ; -> '(((poule) oie) paon)

; Extraire 'OIE des expressions
(cadar '((poule oie pie) paon aigle)) ; -> 'oie
(cadr (cadadr '(aigle (paon (pie oie))))) ; -> 'oie
(caaar '(((oie) poule))) ; -> 'oie
(caaddr '(poule paon (oie) aigle)) ; -> 'oie
(caadr (cadadr '(paon (poule (poulet (oie)))))) ; -> oie
