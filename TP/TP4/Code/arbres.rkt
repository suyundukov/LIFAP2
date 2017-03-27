#lang racket
(provide (all-defined-out))
(define valeur ; -> un atome
  (lambda (arbre) ; - un arbre non vide
    (car arbre)))

(define fils-g ; -> un arbre
  (lambda (arbre) ; - un arbre non vide
    (cadr arbre)))

(define fils-d ; -> un arbre
  (lambda (arbre) ; - un arbre non vide
    (caddr arbre)))

(define vide? ; -> un booléen
  (lambda (arbre) ; - un arbre
    (null? arbre)))

(define arbre? ; -> un booléen
  (lambda (l) ; - une liste
    (or (null? l)
      (and (= 3 (length l))
           (not (list? (car l)))
           (list? (cadr l))
           (arbre? (cadr l))
           (list? (caddr l))
           (arbre? (caddr l))))))

(define feuille? ; -> un booléen
  (lambda (arbre) ; - un arbre
    (and (not (vide? arbre))
         (vide? (fils-g arbre))
         (vide? (fils-d arbre)))))

(define arbre=? ; -> un booléen
  (lambda (arbre1 arbre2) ; - des arbres
    (equal? arbre1 arbre2)))

(define vide ; -> un arbre
  (lambda () ; - rien
    '()))

(define cons-binaire ; -> un arbre
  (lambda (val fg fd) ; - une valeur et deux arbres
    (list val fg fd)))
