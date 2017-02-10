#lang racket
; 2. Premières fonctions en Scheme
; -> renvoie le double d'un nombre passée en paramètre
(define double ; -> un nombre
  (lambda (n) ; - un nombre
    (* 2 n)))

; -> renvoie la moyenne de deux nombres passée en paramètre
(define moyenne ; -> un nombre
  (lambda (a b) ; - un nombre
    (/ (+ a b) 2)))

; -> renvoie un booléen VRAI/FAUX, si le nombre passée en paramètre est positif
(define positive? ; -> un booléen
  (lambda (n) ; - un nombre
    (>= n 0)))
(define positive-alt? ; -> un booléen
  (lambda (n) ; - un nombre
    (if (>= n 0)
      #t
      #f)))

; -> renvoie la mention pour une note donnée
; (Ex.: 15 -> bien, 12 -> assez bien)
(define mention ; -> une chaine de caractère
  (lambda (note) ; - un nombre
    (if (>= note 16) "Tres bien"
      (if (>= note 14) "Bien"
        (if (>= note 12) "Assez bien"
          (if (>= note 10) "Passable"
            "Recale"))))))
(define mention-alt ; -> une chaine de caractère
  (lambda (note) ; - un nombre
    (cond ((>= note 16) "Tres bien")
          ((>= note 14) "Bien")
          ((>= note 12) "Assez bien")
          ((>= note 10) "Passable"))))

; -> renvoie la somme des n premiers entiers
(define somme ; -> un nombre
  (lambda (n) ; - un nombre
    (if (= n 1) 1
      (+ n (somme (- n 1))))))

; -> calcule le Nième terme de la suite Fibonacci
(define fibo ; -> un nombre
  (lambda (n) ; - un nombre
    (if (<= n 2) 1
      (+ (fibo(- n 1)) (fibo(- n 2))))))

; 3. Fonction mystère en Scheme
; -> renvoie la somme de N premiers nombres pairs
(define mystere ; -> un nombre
  (lambda (n) ; - un nombre
    (if (= n 0) 0
      (if (= (modulo n 2) 0)
        (+ n (mystere (- n 1)))
        (mystere (- n 1))))))

; TESTS
(display "(double 6) -> ") (double 6)
(display "(moyenne 5 6) -> ") (moyenne 5 6)
(display "(positive? 5) -> ") (positive? 5)
(display "(mention-alt 13) -> ") (mention-alt 13)
(display "(somme 6) -> ") (somme 6)
(display "(fibo 5) -> ") (fibo 5)
(display "(mystere 6) -> ") (mystere 6)

