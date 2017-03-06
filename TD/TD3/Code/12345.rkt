#lang racket
; Donner la valeur retournée par les expressions ci-dessous :
(list 'a (cons '(b c) '(d))) ; -> '(a ((b c) d))
(append '(a) '(b c) '(d)) ; -> '(a b c d)
(append (list 'a '(b)) '(c)) ; -> '(a (b) c)

; On définit les listes suivantes
(define L1 '(a b c))
(define L2 '(d e))
(list (cdr L1) L2) ; -> '((b c) (d e))
(append (cddr L1) (cdr L2)) ; -> '(c e)
(append (cdr L1) (cons (car L2) '())) ; -> '(b c d)
(list (cadr L1) (caddr L1) (car L2)) ; -> '(b c d)

; -> rend les racines sous forme d'une liste
(define racines
  (lambda (a b c)
    (if (< (- (sqr b) (* 4 a c)) 0) '()
      (if (= (- (sqr b) (* 4 a c)) 0) (list (/ (- b) (* 2 a)))
        (list (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)) (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)))))))

(define racines-alt
 (lambda (a b c)
  (let ((D (- (sqr b) (* 4 a c))))
   (if (< D 0) '()
    (if (= D 0) (list (/ (- b) (* 2 a)))
     (list (/ (- (- b) (sqrt D)) (* 2 a)) (/ (+ (- b) (sqrt D)) (* 2 a))) )))))

(define racines-alt1
 (lambda (a b c)
  (let* ((D (- (sqr b) (* 4 a c)))
        (BA (/ (- b) (* 2 a)))
        (DA (/ (sqrt D) (* 2 a))))
   (if (< D 0) '()
    (if (= D 0) (list BA)
     (list (- BA DA) (+ BA DA)))))))

; -> retourne la somme et le produit d'une liste non vide de nombres
(define som-prod ; -> une liste de 2 nombres
  (lambda (l) ; - une liste de nombres non vide
    (if (null? (cdr l))
      (list (car l) (car l))
      (list (+ (car l) (car (som-prod (cdr l))))
            (* (car l) (cadr (som-prod (cdr l))))))))

(define som-prod-alt ; -> une liste de 2 nombres
  (lambda (l) ; - une liste de nombres non vide
    (if (null? (cdr l))
      (list (car l) (car l))
      (let ((res (som-prod-alt (cdr l))))
        (list (+ (car l) (car res)) (* (car l) (cadr res)))))))

(define som-prod-alt1 ; -> une liste de 2 nombres
  (lambda (l) ; - une liste de nombres non vide
    (spr 0 1 l)))

(define spr ; -> une liste de 2 nombres
  (lambda (s p l) ; - un nombre, un nombre et une liste
    (if (null? l) (list s p)
      (spr (+ s (car l)) (* p (car l)) (cdr l)))))

; -> construit une liste de deux sous-listes : impairs et pairs
(define parite ; -> une liste
  (lambda (l) ; - une liste
    (if (null? l) '(()())
      (let ((res (parite (cdr l))))
        (if (even? (car l))
          (list (car res) (cons (car l) (cadr res)))
          (list (cons (car l) (car res)) (cadr res)))))))

; TESTS
(racines 1 2 -3) ; -> '(-3 1)
(racines-alt 1 2 -3) ; -> '(-3 1)
(racines-alt1 1 2 -3) ; -> '(-3 1)
(som-prod '(1 2 3 4)) ; -> '(10 24)
(som-prod-alt '(1 2 3 4)) ; -> '(10 24)
(som-prod-alt1 '(1 2 3 4)) ; -> '(10 24)
(parite '(1 2 6 5 7)) ; -> '((1 5 7) (2 6))
