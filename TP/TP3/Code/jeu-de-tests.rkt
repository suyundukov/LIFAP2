#lang racket
(require (rename-in "1234.rkt"
                    (minimum minimum1)))
; LIFAP2 - TP1 - Jeu de tests

; TRI PAR SELECTION DU MAXIMUM

; minimum d'une liste triee : min au debut
(minimum1 '(1 2 3 4)) ; -> 1
; minimum d'une liste triee : min e la fin
(minimum1 '(4 3 2 1)) ; -> 1
; minimum d'une liste avec plusieurs min
(minimum1 '(0 1 0 1)) ; -> 0
; minimum d'une liste melangee : min au milieu
(minimum1 '(1 2 0 4)) ; -> 0
; minimum d'une liste melangee : min au debut
(minimum1 '(1 5 3 4)) ; -> 1
; minimum d'une liste melangee : min a la fin
(minimum1 '(4 2 3 1)) ; -> 1
; minimum d'une liste avec des nombres negatifs
(minimum1 '(4 -1 3)) ; -> -1


; x est present dans l
; x au debut de la liste avec des nombres
(enleve '(1 2 3 4) 1) ; -> (2 3 4)
; x a la fin de la liste avec des nombres
(enleve '(4 3 2 1) 1) ; -> (4 3 2)
; x au milieu de la liste avec des nombres
(enleve '(0 1 2 3) 1) ; -> (0 2 3)
; x au milieu de la liste quelconque
(enleve '(1 2 a 0 b 4) 0) ; -> (1 2 a b 4)
(enleve '(1 2 a 0 b 4) 'b) ; -> (1 2 a 0 4)


; tri-min d'une liste triee de facon croissante
(tri-min '(1 2 3 4)) ; -> (1 2 3 4)
; tri-min d'une liste triee  de facon decroissante
(tri-min '(4 3 2 1)) ; -> (1 2 3 4)
; tri-min d'une liste avec des valeurs identiques
(tri-min '(0 1 0 1)) ; -> (0 0 1 1)
; tri-min d'une liste melangee
(tri-min '(1 2 0 4)) ; -> (0 1 2 4)
(tri-min '(1 5 3 4)) ; -> (1 3 4 5)
(tri-min '(4 2 3 1)) ; -> (1 2 3 4)
; minimum d'une liste avec des nombres negatifs
(tri-min '(4 -1 3)) ; -> (-1 3 4)

; LA SUITE DE CONWAY

(conway '(0)) ; -> (1 0)
(conway '(1 0)) ; -> (1 1 1 0)
(conway '(1 1 1 0)) ; -> (3 1 1 0)
(conway '(3 1 1 0)) ; -> (1 3 2 1 1 0)
(conway '(1 3 2 1 1 0)) ; -> (1 1 1 3 1 2 2 1 1 0)

; les n premiers termes

(conwayn 1 '(0)) ;-> ((0))
(conwayn 2 '(0)) ;-> ((0) (1 0))
(conwayn 3 '(0)) ;-> ((0) (1 0) (1 1 1 0))
(conwayn 4 '(0)) ;-> ((0) (1 0) (1 1 1 0) (3 1 1 0))
(conwayn 5 '(0)) ;-> ((0) (1 0) (1 1 1 0) (3 1 1 0) (1 3 2 1 1 0))
(conwayn 1 '(1)) ;-> ((1))
(conwayn 2 '(1)) ;-> ((1) (1 1))
(conwayn 3 '(1)) ;-> ((1) (1 1) (2 1))
(conwayn 4 '(1)) ;-> ((1) (1 1) (2 1) (1 2 1 1))
(conwayn 5 '(1)) ;-> ((1) (1 1) (2 1) (1 2 1 1) (1 1 1 2 2 1))

; LISTE DE LISTES

; Definir une fonction ajoute qui insere un element en tete de la sous-liste dont l indice est passe en parametre.

; ajoute dans une des sous-listes
(ajoute 'a '((e r) (r y b) (t e)) 1) ; -> ((a e r) (r y b) (t e))
(ajoute 'a '((e r) (r y b) (t e)) 2) ; -> ((e r) (a r y b) (t e))
(ajoute 'a '((e r) (r y b) (t e)) 3) ; -> ((e r) (r y b) (a t e))
; ajoute dans une sous-liste qui n existe pas
(ajoute 'a '((e r) (r y b) (t e)) 0) ; -> ((a) (e r) (r y b) (t e))

; Definir une fonction (sp n x y) qui, etant donnes deux nombres x et y,
; calcule les n premiers termes de la suite xn = xn-1 + yn-1 et yn = xn-1 * yn-1.

(sp 0 5 2) ; -> ()
(sp 1 5 2) ; -> ((5 2))
(sp 2 5 2) ; -> ((5 2) (7 10))
(sp 3 5 2) ; -> ((5 2) (7 10) (17 70))
(sp 4 5 2) ; -> ((5 2) (7 10) (17 70) (87 1190))

; LISTES ORDONNEES

; Definir une fonction qui, etant donne un nombre n et une liste l de nombres triee en ordre croissant,
; retourne la liste des elements de l diviseurs de n.
; Attention a ne pas parcourir la liste en totalite quand ce n est pas necessaire.

; avec une liste contenant des diviseurs
(diviseurs '(1 2 3 4 5 8 12 13 15 17) 12) ; -> (1 2 3 4 12)
; avec une liste ne contenant pas de diviseurs
(diviseurs '(5 8 11 13 15 17) 12) ; -> ()
; avec une liste ou les nombres sont tous inferieurs a n
(diviseurs '(1 2 3 4 5 8 11) 12) ; -> (1 2 3 4)
; avec une liste ou les nombres sont tous superieurs a n
(diviseurs '(4 5 8 12 13 15 17) 3) ; -> ()
; avec une liste vide
(diviseurs '() 12) ; -> ()
