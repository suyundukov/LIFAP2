#lang racket
; Donner la valeur retournée par les expressions Scheme
(car (cdr '(a b c d))) ; -> 'b
(car (cdr '(abc d))) ; -> 'd
(cdr '(a (b c d))) ; -> '((b c d))
(cdr '((a b c d))) ; -> '()
(cdr (car (cdr '(a (b c) (d e))))) ; -> '(c)
(cons '(a b) '(c d)) ; -> '((a b) c d)
(cons 'a (cons 'b '(c d))) ; -> '(a b c d)
(cons '(a b) 'c) ; -> '((a b) . c)
(list? (+ 2 3)) ; -> #f
(list? '(+ 2 3)) ; -> #t

; Définir en Scheme
; -> retourne le second élément d’une liste
(define second ; -> second élément d'une liste
  (lambda (l) ; - une liste
    (if (null? l) '()
      (cadr l))))

; -> retourne vrai si une liste n’a qu’un seul élément
(define alone? ; -> un boolèen
  (lambda (l) ; - une liste
    (if (null? l) #f
      (if (null? (cdr l)) #t #f))))

; -> calcule la longueur d’une liste
(define length ; -> un nombre
  (lambda (l) ; - une liste
    (if (null? l) 0
      (+ 1 (length (cdr l))))))

; -> retourne vrai si élément passé en paramètre appartient à la liste
(define present? ; -> un boolèen
  (lambda (l n) ; - une liste et un nombre
    (if (null? l) #f
      (if (equal? n (car l)) #t
        (present? (cdr l) n)))))

; -> retourne le Nième élément d'une liste
(define return ; -> un élément d'une liste
  (lambda (l n) ; - une liste et un nombre
    (if (= n 1) (car l)
      (return (cdr l) (- n 1)))))

; -> insère un élément dans une liste après le Nème élément
(define insert ; -> une liste
  (lambda (l i n) ; - une liste un nombre et un élément
    (if (= i 0) (cons n l)
      (cons (car l) (insert (cdr l) (- i 1) n)))))

; -> retourne le dernier élément d’une liste non vide
(define return-last ; -> un élément d'une liste
  (lambda (l) ; - une liste
    (if (null? (cdr l)) (car l)
      (return-last (cdr l)))))

; Donner la spécification de la fonction mystère ci-dessous :
; -> renvoie le nombre d'élément dans la liste
(define mystere
  (lambda (x l)
    (cond ((null? l) 0)
          ((eq? x (car l)) (+ 1 (mystere x (cdr l))))
          (else (mystere x (cdr l))))))

; TESTS
(display "(second '(a b c d e)) -> ") (second '(a b c d e))
(display "(alone? '(a b c d e)) -> ") (alone? '(a b c d e))
(display "(length '(1 2 3 4 5)) -> ") (length '(1 2 3 4 5))
(display "(present? '(1 2 3 4 5) 3) -> ") (present? '(1 2 3 4 5) 3)
(display "(return '(a b c d e) 3) -> ") (return '(a b c d e) 3)
(display "(insert '(a b c d e) 'A 3) -> ") (insert '(a b c d e) 3 'A)
(display "(return-last '(a b c d e)) -> ") (return-last '(a b c d e))
(display "(mystere 'a '(a a a b c)) -> ") (mystere 'a '(a a a b c))
