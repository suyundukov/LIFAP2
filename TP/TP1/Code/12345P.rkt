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

; 2. Premières fonctions
; -> calcule l'aire d'un cercle
(define aire-cercle ; -> un nombre
  (lambda (r) ; - un nombre
    (* 3.14 r r)))

; -> calcule la valeur absolue d'un nombre
(define absolue ; -> un nombre
  (lambda (n) ; - un nombre
    (if (>= n 0) n (- n))))

; -> calcule la somme des entiers de 1 à N
(define somme ; -> un nombre
  (lambda (n) ; - un nombre
    (if (= 1 n) 1
      (+ n (somme (- n 1))))))

; -> teste si un entier est une puissance de 2
(define square? ; -> un booléen
  (lambda (n) ; - un entier
    (if (or (= n 2) (= n 0)) #t
      (if (< n 0) #f
        (if (= (modulo n 2) 0)
          (square? (/ n 2))
          #f)))))

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

; 5. Fonctions sur les listes
; -> rend la liste où les deux premiers éléments ont été échangés
(define echange ; -> une liste
  (lambda (l) ; - une liste
    (if (null? (cdr l)) l
      (cons (cadr l) (cons (car l) (cddr l))))))

; -> rend la liste privée de son dernier élément
(define tsd ; -> une liste
  (lambda (l) ; - une liste
    (cond
      ((null? l) '())
      ((null? (cdr l)) '())
      (else (cons (car l) (tsd (cdr l)))))))

; -> répète chaque élément d'une liste
(define repete ; -> une liste
  (lambda (l) ; - une liste
    (if (null? l) '()
      (cons (car l) (cons (car l) (repete (cdr l)))))))

; Pour s’entrainer
; -> teste si la suite partant d'un nombre donné finit par passer par 1
(define syracuse? ; -> un nombre
  (lambda (x) ; - un nombre
    (if (= x 1) #t
      (if (= (modulo x 2) 0)
        (syracuse? (/ x 2))
        (syracuse? (+ (* 3 x) 1))))))

; -> concatène deux listes en utilisant uniquement la fonction (CONS)
(define concatene ; -> une liste
  (lambda (l1 l2)
    (if (null? l1) l2
      (cons (car l1) (concatene (cdr l1) l2)))))

; TESTS
(display "(aire-cercle 6) -> ") (aire-cercle 6)
(display "(absolue 6) -> ") (absolue 6)
(display "(somme 5) -> ") (somme 5)
(display "(square? 8) -> ") (square? 8)
(display "(echange '(a b c d e)) -> ") (echange '(a b c d e))
(display "(tsd '(a b c d e)) -> ") (tsd '(a b c d e))
(display "(repete '(a b c d e)) -> ") (repete '(a b c d e))
(display "(syracuse? 15) -> ") (syracuse? 15)
(display "(concatene '(a b c) '(d e)) -> ") (concatene '(a b c) '(d e))
