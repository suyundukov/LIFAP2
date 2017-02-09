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
(define is-positive? ; -> un booléen
  (lambda (n) ; - un nombre
    (>= n 0)))
(define is-positive-alt? ; -> un booléen
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
(display "Le double de 6 est : ") (double 6)
(display "La moyenne de 5 es 6 est : ") (moyenne 5 6)
(display (if (and (is-positive? 5) (is-positive-alt? 5))
           "5 est positif"
           "5 est négatif"))
(display "La mention de 13 est : ") (mention-alt 13)
(display "La somme de 6 premiers entiers est : ") (somme 6)
(display "Le 5ème terme de Fibonacci est : ") (fibo 5)
(display "La somme des nombres pairs jusqu'à 6 est : ") (mystere 6)

