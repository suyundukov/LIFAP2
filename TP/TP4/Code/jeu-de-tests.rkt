#lang racket
(require "12.rkt" "arbres.rkt")
; LIFAP2 - TP4 - Jeu de tests

; RECURSIVITE PROFONDE

; retourne le nb de nb > 0 d'une liste quelconque
; avec que des nombres
(nbsup0 '(-3 2 1 2 -4)) ; -> 3
; avec une li ste plate
(nbsup0 '(& -3 2 1 2 "cvb" -4 r)) ; -> 3
; ave une liste quelconque
(nbsup0 '(& -3 2 (1 (2 "cvb") -4) r)) ; -> 3
; avec une liste vide
(nbsup0 '()) ; -> 0


; Ecrire une fonction qui calcule en profondeur le nombre d'occurrences d'un element dans une liste.
; liste plate
(occ-prof 'a '(a b a c a d a ab)) ; -> 4
; liste profondeur 2 = avec sous-listes
(occ-prof 'a '(a (b a) c a d a ab)) ; -> 4
(occ-prof 'a '(a (b) a c a d a ab)) ; -> 4
(occ-prof 'a '(a (b a) c (a d a) ab)) ; -> 4
; liste profondeur 3 = avec sous-sous-listes
(occ-prof 'a '(a (b a) ((c)) a d a ab)) ; -> 4
(occ-prof 'a '(a (b) a (c (a d) a) ab)) ; -> 4
(occ-prof 'a '(a ((b a) c (a d a)) ab)) ; -> 4
; liste vide
(occ-prof 'a '()) ; -> 0
; element non present
(occ-prof 'z '(a (b a) c (a (d a)) ab)) ; -> 0

; retourne la meme liste mais avec les valeurs absolues des nombres
; avec que des nombres
(absliste '(-3 2 1 2 -4)) ; -> (3 2 1 2 4)
; avec une liste plate
(absliste '(& -3 2 1 2 "cvb" -4 r)) ; -> (& 3 2 1 2 "cvb" 4 r)
; ave une liste quelconque
(absliste '(& -3 2 (1 (2 "cvb") -4) r)) ; -> (& 3 2 (1 (2 "cvb") 4) r)
; avec une liste vide
(absliste '()) ; -> ()

; Ecrire une fonction qui calcule la profondeur d'une liste.
; liste plate
(profondeur '(a b a c a d a ab)) ; -> 1
; liste profondeur 2
(profondeur '(a (b a) c a d a ab)) ; -> 2
(profondeur '(a (b) a c a d a ab)) ; -> 2
(profondeur '(a (b a) c (a d a) ab)) ; -> 2
; liste profondeur 3
(profondeur '(a (b a) ((c)) a d a ab)) ; -> 3
(profondeur '(a (b) a (c (a d) a) ab)) ; -> 3
(profondeur '(a ((b a) c (a d a)) ab)) ; -> 3
; liste vide
(profondeur '()) ; -> 1

; PRIMITIVES SUR LES ARBRES

; arbre asymetrique a droite (noeud 2)
(define a1 '(3 (2 (1 () ()) ()) (7 (5 (4 () ()) (6 () ())) (9 () ()))))
; arbre asymetrique a gauche (noeud 2)
(define a2 '(3 (2 () (1 () ()) ) (7 (5 (4 () ()) (6 () ())) (9 () ()))))
; arbre symetrique
(define a3 '(3 (2 (1 () ()) (0 () ())) (7 (5 (4 () ()) (6 () ())) (9 () ()))))
; arbre vide
(define a4 '())

(vide) ;-> '()
(vide? a1) ;-> #f
(vide? a2) ;-> #f
(vide? a3) ;-> #f
(vide? a4) ;-> #t
(valeur a1) ;-> 3
(fils-g a1) ;-> (2 (1 () ()) ())
(fils-d a1) ;-> (7 (5 (4 () ()) (6 () ())) (9 () ()))
(cons-binaire 1 a4 '()) ;-> (1 () ())
(cons-binaire '* a1 a2) ;-> (* (3 (2 (1 () ()) ()) (7 (5 (4 () ()) (6 () ())) (9 () ()))) (3 (2 () (1 () ())) (7 (5 (4 () ()) (6 () ())) (9 () ()))))
(arbre=? a1 a1) ;-> #t
(arbre=? a1 a2) ;-> #f
(feuille? '(1 () ())) ;-> #t
(feuille? a1) ;-> #f
(feuille? a4) ;-> #f


(arbre? '()) ;-> #t
(arbre? a1) ;-> #t
; il faut que l'arbre soit un liste de longueur 3
(arbre? '(3 4)) ;-> #f
; que les 2eme et 3eme elements soient des listes
(arbre? '(3 4 (5))) ;-> #f
(arbre? '(3 (4) 5)) ;-> #f
; que les 2eme et 3eme elements soient des arbres
(arbre? '(3 (4) (5))) ;-> #f


; FONCTIONS SUR LES ARBRES

; Ecrire une fonction qui compte le nombre de noeuds d un arbre.
(nb-noeuds a1) ; -> 8
(nb-noeuds a2) ; -> 8
(nb-noeuds a3) ; -> 9
(nb-noeuds a4) ; -> 0

; Ecrire une fonction qui compte le nombre de feuilles d un arbre.
(nb-feuilles a1) ; -> 4
(nb-feuilles a2) ; -> 4
(nb-feuilles a3) ; -> 5
(nb-feuilles a4) ; -> 0

; Ecrire une fonction qui multiplie par deux les valeurs des noeuds d un arbre de nombres.
(fois2 a1) ; -> (6 (4 (2 () ()) ()) (14 (10 (8 () ()) (12 () ())) (18 () ())))
(fois2 a2) ; -> (6 (4 () (2 () ())) (14 (10 (8 () ()) (12 () ())) (18 () ())))
(fois2 a3) ; -> (6 (4 (2 () ()) (0 () ())) (14 (10 (8 () ()) (12 () ())) (18 () ())))
(fois2 a4) ; -> ()

; Ecrire une fonction qui renvoie la liste des valeurs des feuilles d'un arbre.
(feuilles a1) ;-> (1 4 6 9)
(feuilles a2) ;-> (1 4 6 9)
(feuilles a3) ;-> (1 0 4 6 9)
(feuilles a4) ;-> ()

; Ecrire une fonction qui prend un arbre binaire et renvoie son miroir :
; pour tous les noeuds de l'arbre, le fils gauche devient le fils droit et le fils droit devient le fils gauche.
(miroir a1) ;-> (3 (7 (9 () ()) (5 (6 () ()) (4 () ()))) (2 () (1 () ())))
(miroir a2) ;-> (3 (7 (9 () ()) (5 (6 () ()) (4 () ()))) (2 (1 () ()) ()))
(miroir a3) ;-> (3 (7 (9 () ()) (5 (6 () ()) (4 () ()))) (2 (0 () ()) (1 () ())))
(miroir a4) ;-> ()
