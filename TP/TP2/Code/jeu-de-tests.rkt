#lang racket
(require (rename-in "123P.rkt"
                    (liste-random liste_random)
                    (nb-test nb_test)
                    (liste-random-pairs liste_random_pairs)))
; LIFAP2 - TP2 - Jeu de tests

; Ecrire une fonction qui renvoie la sous-liste formee de
; tous les symboles d'une liste.

; test sur une liste quelconque :
(symboles '(a 2 b (6 z) "toto" 7 f)) ; -> (a b f)
; test sur une liste sans symbole :
(symboles '(2 (6 z) "toto" 7)) ; -> ()
; test sur une liste avec uniquement des symboles :
(symboles '(a b f)) ; -> (a b f)
; test sur une liste vide
(symboles '()) ; -> ()

; Ecrire une fonction qui, etant donnee une liste de longueur paire, regroupe deux elements
;consecutifs dans une liste.

; avec une liste de longueur paire
(regroupe '(a b c d e f)) ; -> ((a b) (c d) (e f))
(regroupe '(a b)) ; -> ((a b))
; avec une liste de longueur impaire : interdit
; avec une liste vide
(regroupe '()) ; -> ()

; Écrire une fonction qui renverse une liste.

; avec une liste non vide
(renverse '(a b c d)) ; -> (d c b a)
; avec une liste vide
(renverse '()) ; -> ()

; Ecrivez une fonction qui remplace toutes les occurrences
; d un element e1 dans une liste L par un autre element e2.

; test sur une liste quelconque, e1 dans l et e2 pas dans l :
(remplace 'o 'i '(b o n j o u r)) ; -> (b i n j i u r)
; test sur une liste quelconque, e1 dans l et e2 dans l :
(remplace 'o 'u '(b o n j o u r)) ; -> (b u n j u u r)
(remplace 'u 'o '(b o n j o u r)) ; -> (b o n j o o r)
; test sur une liste quelconque, e1 pas dans l et e2 pas dans l :
(remplace 'a 'i '(b o n j o u r)) ; -> (b o n j o u r)
; test sur une liste quelconque, e1 pas dans l et e2 dans l : :
(remplace 'a 'u '(b o n j o u r)) ; -> (b o n j o u r)
; test sur une liste vide, e1 et e2 quelconques :
(remplace 'o 'i '()) ; -> ()


; Ecrire une fonction qui rend la liste des n+1 premiers
; nombres de la suite de Fibonacci (de u0 a un) sans
; faire plusieurs fois les memes calculs.

; test sur des entiers quelconques >0 :
(fibo-liste 5) ; -> (8 5 3 2 1 1)
(fibo-liste 4) ; -> (5 3 2 1 1)
(fibo-liste 1) ; -> (1 1)
; test sur nombre nul hors specification

; Ecrire une fonction qui calcule le nième terme de la suite de Fibonacci

; test sur des entiers quelconques >0 :
(fibo 5) ; -> 8
(fibo 4) ; -> 5

; Ecrire une fonction qui etant donnee une liste,
; construit une liste de deux sous-listes : celle
; contenant les symboles et celle contenant les nombres.

; test sur une liste quelconque avec des symboles et des nombres :
(trie '(tor 1 tue la 2 3 pin 4)) ; -> ((tor tue la pin)(1 2 3 4))
; test sur une liste triee : symboles puis nombres :
(trie '(tor tue la pin 1 2 3 4)) ; -> ((tor tue la pin)(1 2 3 4))
; test sur une liste triee : nombres puis symboles :
(trie '(1 2 3 4 tor tue la pin)) ; -> ((tor tue la pin)(1 2 3 4))
; test sur une liste sans symbole :
(trie '(1 2 3 4)) ; -> (()(1 2 3 4))
; test sur une liste sans nombre :
(trie '(tor tue la pin)) ; -> ((tor tue la pin)())
; test sur une liste vide :
(trie '()) ; -> (() ())
; test sur une liste contenant autre chose que des nombres ou symboles hors specification

; Rcrire une fonction qui calcule la somme des chiffres d’un entier positif.

; test sur des entiers quelconques >0 :
(somme-des-chiffres 1) ; -> 1
(somme-des-chiffres 31) ; -> 4
(somme-des-chiffres 431) ; ->8

; Ecrire une fonction qui verifie que tous les elements d une liste sont egaux.

; sur une liste vide
(egaux? '()) ; -> #t
; sur une liste de taille variee ou tous les elements sont egaux
(egaux? '(a a a a)) ; -> #t
(egaux? '(b b)) ; -> #t
(egaux? '(c)) ; -> #t
; sur une liste avec des elements differents
(egaux? '(a a b)) ; -> #f
(egaux? '(a b a)) ; -> #f
(egaux? '(b a a)) ; -> #f
(egaux? '(b a)) ; -> #f

; Ecrire une fonction qui supprime tous les elements d une liste qui sont egaux a un
; element e passe en argument.

; sur une liste vide
(supprime '() 'a) ; -> ()
; sur une liste quelconque avec un element present dans la liste
(supprime '(a b c a a b c b a) 'a) ; -> (b c b c b)
(supprime '(a b c a a b c b a) 'b) ; -> (a c a a c a)
(supprime '(a b c a a b c b a) 'c) ; -> (a b a a b b a)
; avec un element non present dans la liste
(supprime '(a b c a a b c b a) 'w) ; -> (a b c a a b c b a)


; Ecrivez une fonction qui renvoie la sous-liste formee
; des n premiers elements d'une liste.

; n toujours <= a la longueur de la liste
; test sur une liste quelconque et n=1 (1er element) :
(premiers 1 '(a b c d e)) ; -> (a)
; test sur une liste quelconque et n quelconque :
(premiers 3 '(a b c d e)) ; -> (a b c)
; test sur une liste quelconque et n pour avoir le dernier element :
(premiers 5 '(a b c d e)) ; -> (a b c d e)
; test sur une liste quelconque et n=0 :
(premiers 0 '(a b c d e)) ; -> ()
; test sur une liste vide et n=0 :
(premiers 0 '()) ; -> ()

; Ecrire une fonction qui calcule n!+100/n!+4 avec un seul
; appel a (factorielle n).

; test sur des entiers quelconques :
(f 1) ; -> 20 1/5
(f 2) ; -> 17
(f 3) ; -> 10 3/5
; test sur nombre nul
(f 0) ; -> 20 1/5

; Ecrire une fonction qui retourne une liste de nombres entiers positifs pris au hasard.
; Les deux parametres de cette fonction sont la longueur de la liste a construire
; et la valeur maximale des nombres a engendrer.

; 5 nombres inferieurs a 10
(liste_random 5 10) ; -> (7 9 6 7 4) ou (7 5 10 4 6) ou ...
; 5 nombres inferieurs a 5
(liste_random 5 5) ; -> (5 3 3 2 3) ou ...
; 10 nombres inferieurs a 100
(liste_random 10 100) ; -> (3 85 13 10 86 5 13 28 43 54) ou ...
; Attention, le resultat varie... il faut juste vérifier la longeur de la liste et son contenu

; Ecrire une fonction qui retourne une liste composee d un nombre entier pris au hasard entre 0 et N
; et d un booléen indiquant si ce nombre est un multiple de trois ou de sept.

(nb_test 10) ; -> (5 #f)
(nb_test 10) ; -> (6 #t)

; Ecrire une fonction identique a la fonction liste_random, mais qui ne retourne que des nombres pairs.

(liste_random_pairs 5 10) ; -> (4 10 6 4 6) ou (10 4 4 0 4) ou ...

; Écrire une fonction qui, étant donné un nombre x et
; une liste de nombres L, construit deux listes :
; celle des nombres de L inférieurs ou égaux à x,
; et celle des nombres de L supérieurs à x.

; avec un separateur compris dans l'intervalle des nombres
(separe 3 '(5 1 2 3 6 4)) ; -> ((1 2 3) (5 6 4))
; avec un separateur plus petit que les nombres
(separe 0 '(5 1 2 3 6 4)) ; -> (() (5 1 2 3 6 4))
; avec un separateur plus grand que les nombres
(separe 10 '(5 1 2 3 6 4)) ; -> ((5 1 2 3 6 4) ())
