#lang racket
(provide (all-defined-out))
; 1. Tri par sélection du minimum
; -> calcule le minimum d'une liste de nombres
(define minimum ; -> un nombre
  (lambda (l) ; - une liste
    (if (null? (cdr l)) (car l)
      (let ((res (minimum (cdr l))))
        (if (< (car l) res)
          (car l)
          res)))))

; -> supprime un élément d’une liste
(define enleve ; -> une liste
  (lambda (l n) ; - une liste et un élément
    (if (null? l) '()
      (if (eq? n (car l)) (cdr l)
        (cons (car l) (enleve (cdr l) n))))))

; -> trie une liste de nombres par sélection du minimum
(define tri-min ; -> une liste
  (lambda (l) ; - une liste
    (if (or (null? l) (null? (cdr l))) l
      (let ((res (minimum l)))
        (cons res (tri-min (enleve l res)))))))

; 2. Listes de listes : la suite de Conway
; -> calcule un terme de la suite de Conway à partir du précédent
(define conway ; -> une liste
  (lambda (l) ; - une liste non vide
    (if (null? (cdr l)) (cons 1 l)
      (let ((c (conway (cdr l))))
        (if (= (car l) (cadr l))
          (cons (+ 1 (car c)) (cdr c))
          (cons 1 (cons (car l) c)))))))

(define compte ; -> une liste
  (lambda (n l) ; - un entier et une liste
    (if (null? (cdr l)) (list n (car l))
      (if (equal? (car l) (cadr l))
        (compte (+ 1 n) (cdr l))
        (cons n (cons (car l) (compte 1 (cdr l))))))))

(define conway-alt ; -> une liste
  (lambda (l) ; - une liste
    (if (null? (cdr l)) (cons 1 l)
      (compte 1 l))))

; -> calcule les n premiers termes de la suite de Conway
(define conwayn ; -> une liste
  (lambda (n l) ; - un entier et une liste
    (if (= n 1)
        (list l)
        (cons l (conwayn (- n 1) (conway l))))))

; 3. D’autres listes de listes
; -> insère un élément en tête de la sous-liste dont l'indice > en paramètre
(define ajoute ; -> une liste
  (lambda (e l i) ; - un élément, une liste et un indice
    (if (= i 0) (cons (list e) l)
      (if (= i 1)
        (cons (cons e (car l)) (cdr l))
        (cons (car l) (ajoute e (cdr l) (- i 1)))))))

; -> calcule les n premiers termes de la suite
(define sp ; -> une liste
  (lambda (n x y) ; - des nombres
    (if (= n 0) '()
      (cons (list x y) (sp (- n 1) (+ x y) (* x y))))))

; 4. -> retourne la liste des éléments de L diviseurs de n
(define diviseurs ; -> une liste
  (lambda (l n) ; - une liste et un nombre
    (if (or (null? l) (< n (car l))) '()
      (let ((res (diviseurs (cdr l) n)))
      (if (= (modulo n (car l)) 0)
        (cons (car l) res)
        res)))))
