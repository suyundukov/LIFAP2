#lang racket
(require "arbres.rkt")
(provide (all-defined-out))
; Récursivité profonde
; -> compte en profondeur le nombre de nombres positifs
(define nbsup0 ; -> un entier
  (lambda (l) ; - une liste
    (cond ((null? l) 0)
          ((list? (car l)) (+ (nbsup0 (car l)) (nbsup0 (cdr l))))
          ((and (number? (car l)) (< 0 (car l))) (+ 1 (nbsup0 (cdr l))))
          (else (nbsup0 (cdr l))))))

; -> calcule en profondeur le nombre d’occurrences d’un élément dans une liste
(define occ-prof ; -> un entier
  (lambda (e l) ; - une liste
    (cond ((null? l) 0)
          ((list? (car l)) (+ (occ-prof e (car l)) (occ-prof e (cdr l))))
          ((eq? e (car l)) (+ 1 (occ-prof e (cdr l))))
          (else (occ-prof e (cdr l))))))

; -> remplace en profondeur tout nombre d’une liste par sa valeur absolue
(define absliste ; -> une liste
  (lambda (l) ; - une liste
    (cond ((null? l) '())
          ((list? (car l)) (cons (absliste (car l)) (absliste (cdr l))))
          ((number? (car l)) (cons (abs (car l)) (absliste (cdr l))))
          (else (cons (car l) (absliste (cdr l)))))))

; -> calcule la profondeur d'une liste
(define profondeur ; -> un entier
  (lambda (l) ; - une liste
    (cond ((null? l) 1)
          ((list? (car l)) (max (+ 1 (profondeur (car l))) (profondeur (cdr l))))
          (else (profondeur (cdr l))))))

; Arbres binaires
; -> compte le nombre de nœuds d’un arbre
(define nb-noeuds ; -> un entier
  (lambda (A) ; - un arbre
    (if (vide? A) 0
      (+ 1 (nb-noeuds (fils-g A)) (nb-noeuds (fils-d A))))))

; -> compte le nombre de feuilles d’un arbre
(define nb-feuilles ; -> un entier
  (lambda (A) ; - un arbre
    (if (vide? A) 0
      (+ (if (feuille? A) 1 0) (nb-feuilles (fils-g A)) (nb-feuilles (fils-d A))))))

; -> multiplie par deux les valeurs des nœuds d’un arbre de nombres
(define fois2 ; -> un arbre
  (lambda (A) ; - un arbre de nombres
    (if (vide? A) '()
      (cons-binaire (* (valeur A) 2) (fois2 (fils-g A)) (fois2 (fils-d A))))))

; -> renvoie la liste des valeurs des feuilles d’un arbre
(define feuilles ; -> un arbre
  (lambda (A) ; - un arbre
    (if (vide? A) '()
      (if (feuille? A)
        (cons (valeur A) (append (feuilles (fils-g A)) (feuilles (fils-d A))))
        (append (feuilles (fils-g A)) (feuilles (fils-d A)))))))

; -> prend un arbre binaire et renvoie son miroir
(define miroir ; -> un arbre
  (lambda (A) ; - un arbre
    (if (vide? A) '()
      (cons-binaire (valeur A) (miroir (fils-d A)) (miroir (fils-g A))))))
