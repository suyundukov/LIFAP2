#lang racket
; LIFAP2 - TP1

(define aire_cercle ; -> nombre
  (lambda (r) ; r nombre
    (* 3.14 (* r r))))

(define absolue ; -> nombre positif
  (lambda (x) ; x nombre
    (if (>= x 0)
        x
        (- x))))

(define somme ; -> nombre
  (lambda (n) ; n entier
    (if (= n 0)
        0
        (+ n (somme (- n 1))))))

(define puissance2? ; -> boolen
  (lambda( n) ; n entier > 0
    (or (= n 1)
        (if (integer? (/ n 2))
            (puissance2? (/ n 2))
            #f))))

(define echange ; -> liste
  (lambda (l) ; l  liste
    (cons (cadr l) (cons (car l) (cddr l)))))

(define tsd ; -> liste
  (lambda (l) ; l liste non vide
    (if (null? (cdr l))
        '()
        (cons (car l) (tsd (cdr l))))))

(define repete ; -> liste
  (lambda (l) ; l liste
    (if (null? l)
        '()
        (cons (car l) (cons (car l) (repete (cdr l)))))))

; exercices facultatifs

(define syracuse? ; -> booleen
  (lambda (un) ; un entier > 0
    (or (= un 1)
        (if (even? un)
            (syracuse? (/ un 2))
            (syracuse? (+ 1 (* 3 un)))))))


(define concat ; -> liste
  (lambda (l1 l2) ; l1 et l2 listes
    (if (null? l1)
        l2
        (cons (car l1) (concat (cdr l1) l2)))))
