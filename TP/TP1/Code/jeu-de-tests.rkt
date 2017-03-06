#lang racket
(require (rename-in "25P.rkt"
                    (aire-cercle aire_cercle)))
; LIFAP2 - TP1 - Jeu de tests

; Ecrire une fonction qui calcule l aire d un cercle de rayon r.

; avec des nombres positifs
(aire_cercle 3) ; -> 28,26
(aire_cercle 5) ; -> 78,5
; avec le nombre nul
(aire_cercle 0) ; -> 0

; Ecrire une fonction qui calcule la valeur absolue d un nombre.

; avec un nombre positif
(absolue 3) ; -> 3
; avec un nombre négatif
(absolue -3) ; -> 3
; avec le nombre nul
(absolue 0) ; -> 0

; Ecrire une fonction qui calcule la somme des entiers positifs de 1 à n.

; avec zero
(somme 0) ; -> 0
; avec un
(somme 1) ; -> 1
; avec des nombres plus grands
(somme 2) ; -> 3
(somme 5) ; -> 15
(somme 10) ; -> 55

; Ecrire une fonction qui teste si un entier strictement positif est une puissance de 2.

; avec des puissances de 2
(puissance2? 2) ; -> #t
(puissance2? 1) ; -> #t
(puissance2? 4) ; -> #t
(puissance2? 8) ; -> #t
; avec des non-puissances de 2
(puissance2? 3) ; -> #f
(puissance2? 6) ; -> #f
; avec zero : interdit

; Ecrire une fonction qui prend une liste d au moins deux elements en argument
; et rend la liste equivalente ou les deux premiers elements ont ete echanges.

; avec une liste avec deux elements
(echange '(a b)) ; -> (b a)
(echange '(1 2)) ; -> (2 1)
; avec une liste avec plus d'elements
(echange '(a b c)) ; -> (b a c)
(echange '(1 2 3)) ; -> (2 1 3)
(echange '(a 1 b)) ; -> (1 a b)

; Ecrire une fonction qui, etant donnee une liste non vide, rend la liste privee de son dernier element.

; avec une liste avec un element
(tsd '(1)) ; -> ()
(tsd '(a)) ; -> ()
; avec une liste avec plus d elements
(tsd '(1 2 3)) ; -> (1 2)
(tsd '(3 2 1)) ; -> (3 2)
(tsd '(a b a)) ; -> (a b)

; Ecrire une fonction qui repete chaque element d une liste.

; avec une liste vide
(repete '()) ; -> ()
; avec une liste avec un element
(repete '(a)) ; -> (a a)
; avec une liste avec plus d elements
(repete '(a b)) ; -> (a a b b)
(repete '(a b a)) ; -> (a a b b a a)

; Ecrire une fonction syracuse? testant si la suite partant d un nombre u0 donne en argument finit par passer par 1.

; avec des nombres varies strictement positifs
(syracuse? 1) ; -> #t
(syracuse? 4) ; -> #t
(syracuse? 16) ; -> #t
(syracuse? 21) ; -> #t
; et pour dérouler pas à pas, avec 5
(syracuse? 5) ; -> #t

; Ecrire une fonction qui concatene deux listes en utilisant uniquement la fonction cons

; avec 2 listes non vides
(concat '(a b c) '(d e)) ; -> (a b c d e)
; avec la premiere liste vide
(concat '() '(d e)) ; -> (d e)
; avec la deuxiemme liste vide
(concat '(a z) '()) ; -> (a z)
