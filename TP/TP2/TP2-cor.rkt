#lang racket
; LIFAP2 - TP2

(define symboles ; -> liste de symboles
  (lambda (l) ; liste quelconque
    (cond ((null? l) l)
          ((symbol? (car l)) (cons (car l) (symboles (cdr l))))
          (else (symboles (cdr l))))))

(define regroupe ; -> liste de couples
  (lambda (l) ; l liste de longueur paire
    (if (null? l)
        '()
        (cons (list (car l) (cadr l)) (regroupe (cddr l))))))

(define renverse ; -> liste
  (lambda (l) ; l liste
    (if (null? l)
        l
        (append (renverse (cdr l)) (list (car l))))))

(define remplace ; -> liste
  (lambda (e1 e2 l) ; e1 et e2 atomes, l liste
    (cond ((null? l) l)
          ((eq? e1 (car l)) (cons e2 (remplace e1 e2 (cdr l))))
          (else (cons (car l) (remplace e1 e2 (cdr l)))))))

;;; MEMORISATION

(define fibo-liste ; -> liste de nombres
  (lambda (n) ; n entier > 0
    (if (= n 1)
        '(1 1)
        (let ((res (fibo-liste (- n 1))))
          (cons (+ (car res) (cadr res)) res)))))

; version initiale du TD
; recalcule sans arret les memes valeurs
(define fibo ; -> nombre
  (lambda (n) ; n entier positif
    (if (= 0 n)
        1
        (if (= n 1)
            1
            (+ (fibo (- n 1)) (fibo (- n 2)))))))

; version qui utilise fibo-liste qui stocke dans la liste les termes utiles au calcul
(define fibo-bis  ; -> nombre
  (lambda (n)  ; n entier positif
    (if (= 0 n)
        1
        (car (fibo-liste n)))))

(define trie ; -> liste de deux sous-listes
  (lambda (l) ; l liste de symboles et de nombres
    (if (null? l)
        '(() ())
        (let ((r (trie (cdr l))))
          (if (number? (car l))
              (list (car r) (cons (car l) (cadr r)))
              (list (cons (car l) (car r)) (cadr r)))))))

; Calculs en remontant ou en descendant

; version classique, avec calcul en remontant
(define somme-des-chiffres ; -> entier
  (lambda (n) ; n entier positif
    (if (< n 10) ;  ou bien n=0 -> 0
        n
        (+ (modulo n 10)
           (somme-des-chiffres (quotient n 10))))))


; version avec parametre pour calcul en descendant
; fonction qui repond a la specification (important d'insister sur le fait qu'il en faut une)
(define somme-des-chiffres-accumulateur ; -> entier
  (lambda (n) ; n entier positif
    (sommebis n 0)))

; fonction qui fait le boulot
(define sommebis
  (lambda (n c) ; entiers positifs
    (if (= n 0) ; ou bien n<10 -> n+c
        c
        (sommebis (quotient n 10) (+ c (modulo n 10))))))


; exercices facultatifs

(define egaux? ; -> booleen
  (lambda (l) ; l liste
    (or (null? l)
        (null? (cdr l))
        (and (eq? (car l) (cadr l))
             (egaux? (cdr l))))))

(define supprime ; -> liste
  (lambda (l e) ; l liste, e atome
    (if (null? l)
        '()
        (if (eq? (car l) e)
            (supprime (cdr l) e)
            (cons (car l) (supprime (cdr l) e))))))

(define premiers ; -> liste
  (lambda (n l) ; l liste, n entier compris entre 1 et la longueur de l
    (if (= 0 n)
        '()
        (cons (car l) (premiers (- n 1) (cdr l))))))

(define fact ;-> entier
  (lambda (n) ; n entier
    (if (= n 0)
        1
        (* n (fact (- n 1))))))

(define f ; -> nombre
  (lambda (n) ; n entier
    (let ((fn (fact n)))
      (/ (+ fn 100) (+ fn 4)))))

(define liste_random ; -> liste de nombres
  (lambda (longueur max) ; nombres entiers positifs
    (if (= longueur 0)
        '()
        (cons (random (+ max 1)) (liste_random (- longueur 1) max)))))

(define nb_test ; -> liste d'un nombre et d'un booleen
  (lambda (n) ; nb entier positif
    (let ((x (random (+ n 1))))
      (list x (or (integer? (/ x 7)) (integer? (/ x 3)))))))


(define liste_random_pairs ; -> liste de nombres
  (lambda (longueur max) ; nombres entiers positifs
    (if (= longueur 0)
        '()
        (let ((v (random (+ max 1))))
          (if (even? v)
              (cons v (liste_random_pairs (- longueur 1) max))
              (liste_random_pairs longueur max))))))

(define separe ; -> liste de 2 listes de nb
  (lambda (x l) ; x nb, l liste de nb
    (if (null? l)
        '(()())
        (let ((r (separe x (cdr l))))
          (if (<= (car l) x)
              (list (cons (car l) (car r)) (cadr r))
              (list (car r) (cons (car l) (cadr r))))))))
