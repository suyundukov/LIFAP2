#lang racket
(provide (all-defined-out))
; 1. Fonctions sur les listes
; -> renvoie la sous-liste formée de tous les symboles d'une liste
(define symboles ; -> une liste
  (lambda (l) ; - une liste
    (if (null? l) '()
      (if (symbol? (car l))
        (cons (car l) (symboles (cdr l)))
        (symboles (cdr l))))))

; -> regroupe deux éléments consécutifs dans une liste
(define regroupe ; -> une lsite
  (lambda (l) ; - une liste de longueur paire
    (if (null? l) '()
      (cons (list (car l) (cadr l)) (regroupe (cddr l))))))

; -> renverse une liste
(define renverse ; -> une liste
  (lambda (l) ; - une liste
    (if (null? l) '()
      (append (renverse (cdr l)) (list (car l))))))

; -> remplace les occurence d'un élément dans une liste par un autre élément
(define remplace ; -> une liste
  (lambda (e e1 l) ; - un élément à remplacer, un élément et une liste
    (if (null? l) '()
      (if (eq? (car l) e)
        (cons e1 (remplace e e1 (cdr l)))
        (cons (car l) (remplace e e1 (cdr l)))))))

; 2. Mémorisation
; -> rend la liste des n + 1 premiers nombres de la suite Fibonacci
(define fibo-liste ; -> une liste
  (lambda (n) ; - une liste
    (if (< n 2) '(1 1)
      (let ((fibo (fibo-liste (- n 1))))
        (cons (+ (car fibo) (car (fibo-liste (- n 2)))) fibo)))))

; -> calcule le Nème terme de la suite
(define fibo ; -> un entier
  (lambda (n) ; - un entier
    (car (fibo-liste n))))

; -> construit une liste, contenant les symboles et les nombres dans les sous-listes
(define trie ; -> une liste
  (lambda (l) ; - une liste
    (if (null? l) '(()())
      (let ((res (trie (cdr l))))
        (if (symbol? (car l))
          (list (cons (car l) (car res)) (cadr res))
          (list (car res) (cons (car l) (cadr res))))))))

; 3. Calculs en remontant ou en descendant
; -> calcule la somme des chiffres d'un entier positif
(define somme-des-chiffres ; -> un entier
  (lambda (n) ; - un entier positif
    (if (< n 1) n
      (+ (modulo n 10) (somme-des-chiffres (quotient n 10))))))

(define somme-des-chiffres-alt ; -> un entier
  (lambda (n) ; - un entier
    (sommes 0 n)))

(define sommes ; -> un entier
  (lambda (a n) ; - un entier
    (if (= n 0) a
        (sommes (+ a (modulo n 10)) (quotient n 10)))))

; Pour s'entrainer (exercices supplémentaires facultatifs)
; -> verifie que tous les éléments sont égaux
(define egaux? ; -> un booléen
  (lambda (l) ; - une liste
    (if (or (null? l) (null? (cdr l))) #t
      (if (eq? (car l) (cadr l)) (egaux? (cdr l))
        #f))))

; -> supprime tous les éléments E dans une liste
(define supprime ; -> une liste
  (lambda (l e) ; - une liste et un élément à supprimer
    (if (null? l) '()
      (let ((res (supprime (cdr l) e)))
        (if (eq? (car l) e) res
          (cons (car l) res))))))

; -> renvoie une liste formée des N premiers éléments d'une liste
(define premiers ; -> une liste
  (lambda (n l) ; - une liste
    (if (= n 0) '()
      (cons (car l) (premiers (- n 1) (cdr  l))))))

; -> calcule N! + 100 / N! + 4 avec un seul appel à (factorielle n)
(define factorial ; -> un entier
  (lambda (n) ; - un entier
    (if (= n 0) 1
      (* n (factorial (- n 1))))))

(define f ; -> un nombre
  (lambda (n) ; - un entier
    (let ((res (factorial n)))
      (/ (+ res 100) (+ res 4)))))

; -> retourne une liste de nombres entiers positifs pris au hasard
(define liste-random ; -> une liste
  (lambda (n m) ; - deux entiers
    (if (= n 0) '()
      (cons (random m) (liste-random (- n 1) m)))))

; -> retourne une liste d’un entier entre 0 et N, et d’un booléen indiquant si ce nombre est un multiple de trois ou de sept
(define nb-test ; -> une liste
  (lambda (n) ; - un entier
    (let ((r (random n)))
      (list r (or (= (modulo r 3) 0) (= (modulo r 7) 0))))))

; -> identique à la fonction LISTE-RANDOM, ne retourne que des nombres pairs
(define liste-random-pairs ; -> une liste
  (lambda (n m) ; - deux entiers
    (if (= n 0) '()
      (let ((r (random m)))
        (if (even? r)
          (cons r (liste-random-pairs (- n 1) m))
          (liste-random-pairs n m))))))

(define separe ; -> une liste
  (lambda (x l) ; - une liste
    (if (null? l) '(()())
      (let ((res (separe x (cdr l))))
        (if (<= (car l) x)
          (list (cons (car l) (car res)) (cadr res))
          (list (car res) (cons (car l) (cadr res))))))))
