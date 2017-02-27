#lang racket
(provide (all-defined-out))
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
    (if (= 0 n) 0
      (+ n (somme (- n 1))))))

; -> teste si un entier est une puissance de 2
(define puissance2? ; -> un booléen
  (lambda (n) ; - un entier
    (if (or (= n 2) (= n 0) (= n 1)) #t
      (if (< n 0) #f
        (if (= (modulo n 2) 0)
          (puissance2? (/ n 2))
          #f)))))

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
(define concat ; -> une liste
  (lambda (l1 l2)
    (if (null? l1) l2
      (cons (car l1) (concat (cdr l1) l2)))))
