#lang racket
; 1. Tri par insertion
; -> insère au bon endroit un nombre dans une liste de nombres triée
(define insere ; -> une liste
  (lambda (n l) ; - un nombre et une liste
    (if (null? l) (list n)
      (if (< n (car l)) (cons n l)
        (cons (car l) (insere n (cdr l)))))))

; -> trie une liste de nombres non vide
(define tri-insertion ; -> une liste
  (lambda (l) ; - une liste
    (if (or (null? l) (null? (cdr l))) l
      (insere (car l) (tri-insertion (cdr l))))))

; 2. Récursivité profonde
; -> calcule le nombre total d'éléments d'une liste quelconque
(define compter ; -> un entier
  (lambda (l) ; - une liste
    (if (null? l) 0
      (if (list? (car l))
        (+ (compter (car l)) (compter (cdr l)))
        (+ 1 (compter (cdr l)))))))

; -> ajoute 2 à chaque nombre de cette liste en profondeur
(define ajoute2 ; -> une liste
  (lambda (l) ; - une liste
    (cond ((null? l) '())
          ((number? (car l)) (cons (+ 2 (car l)) (ajoute2 (cdr l))))
          ((list? (car l)) (cons (ajoute2 (car l)) (ajoute2 (cdr l))))
          (else (cons (car l) (ajoute2 (cdr l)))))))

; -> remplace en profondeur les nombres de la liste par un booléen (even?)
(define pairs? ; -> une liste
  (lambda (l) ; - une liste
    (cond ((null? l) '())
          ((list? (car l)) (cons (pairs? (car l)) (pairs? (cdr l))))
          (else (cons (even? (car l)) (pairs? (cdr l)))))))

; 3. Tri à bulles
; -> fait remonter le minimum en début de liste
(define bulle ; -> une liste
  (lambda (l) ; - une liste
    (if (null? (cdr l)) l
      (let ((res (bulle (cdr l))))
        (if (< (car l) (car res))
          (cons (car l) res)
          (cons (car res) (cons (car l) (cdr res))))))))

; -> trie une liste de nombres par appels à la fonction BULLE
(define tri-bulle ; -> une liste
  (lambda (l) ; - une liste
    (if (null? l) '()
      (let ((res (bulle l)))
        (cons (car res) (tri-bulle (cdr res)))))))

; TESTS
(insere 4 '(1 2 5 7)) ; -> '(1 2 4 5 7)
(tri-insertion '(7 4 9 1)) ; -> '(1 4 7 9)
(compter '(1 2 (q w e) (r (e (w t)) 3 (e)) (o))) ; -> 12
(ajoute2 '(2 b (10 a (56 3) 5) 4)) ; -> '(4 b (12 a (58 5) 7) 6)
(pairs? '(2 (3) 5 (6 (7)))) ; -> '(#t (#f) #f (#t (#f)))
(bulle '(7 9 1 6 2 3)) ; -> '(1 7 9 2 6 3)
(tri-bulle '(7 9 1 6 2 3)) ; -> '(1 2 3 6 7 9)
