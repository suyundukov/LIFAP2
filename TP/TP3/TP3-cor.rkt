#lang racket
; LIFAP2 - TP3

; TRI PAR SELECTION DU MINIMUM

(define minimum1 ; -> nombre
  (lambda (l) ; l liste de nombres
    (if (null? (cdr l))
        (car l)
        (let ((m (minimum1 (cdr l))))
          (if (< (car l) m)
            (car l)
            m)))))

; autre version qui ne necessite pas de let, mais nettement moins intuitive
(define minimum2 ; -> nombre
  (lambda (l) ; l liste de nombres
    (if (null? (cdr l))
        (car l)
        (if (< (car l) (cadr l))
            (minimum2 (cons (car l) (cddr l)))
            (minimum2 (cdr l))))))

; la version la plus simple
(define minimum ; -> nombre
  (lambda (l) ; l liste de nombres
    (if (null? (cdr l))
        (car l)
        (min (car l) (minimum (cdr l))))))

; n'enleve qu'une occurrence de x, sinon les elements repetes dans la liste de depart disparaissent
(define enleve ; -> liste
  (lambda (l x) ; l liste, x element
    (cond ((null? l) l) ; cas inutile dans le contexte du tri-min
          ((eq? x (car l))(cdr l))
          (else (cons (car l) (enleve (cdr l) x))))))

(define tri-min ; -> liste de nombres triee
  (lambda (l) ; l liste de nombres
    (if (null? (cdr l))
        l
        (let ((m (minimum l)))
          (cons m (tri-min (enleve l m)))))))

; LA SUITE DE CONWAY

; une version "classique", sans compteur
(define conway ; -> liste de chiffres
  (lambda (l) ; liste non vide de chiffres
    (if (null? (cdr l))
        (cons 1 l)
        (let ((c (conway (cdr l))))
         (if (= (car l) (cadr l))
             (cons (+ 1 (car c)) (cdr c))
             (cons 1 (cons (car l) c)))))))

; une version "iterative", avec compteur
(define conwaybis ; -> liste de chiffres
  (lambda (l) ; liste non vide de chiffres
    (if (null? (cdr l))
        (cons 1 l)
        (conway2 1 l))))

(define conway2 ; -> liste de chiffres
  (lambda (n l) ; n comteur entier, l liste non vide de chiffres
    (cond ((null? (cdr l)) (list n (car l)))
          ((equal? (car l) (cadr l)) (conway2 (+ 1 n) (cdr l)))
          (else (cons n (cons (car l) (conway2 1 (cdr l))))))))

; les n premiers termes
(define conwayn ; -> liste de listes de chiffres
  (lambda (n l) ; n entier, l liste de chiffres
    (if (= n 1)
        (list l)
        (cons l (conwayn (- n 1) (conway l))))))


; LISTE DE LISTES

; ajoute un element en tete de la sous-liste dont l'indice est passe en parametre
(define ajoute ; -> liste de listes
  (lambda (e l i) ; e atome, l liste de listes, i entier, 0=<i=<longueur(l)
    (cond ((= i 0) (cons (list e) l))
          ((= i 1) (cons (cons e (car l)) (cdr l)))
          (else (cons (car l) (ajoute e (cdr l) (- i 1)))))))

(define sp ; -> liste de couples
  (lambda (n x y) ; n entier, x y nombres
    (if (= n 0)
        '()
       (cons (list x y) (sp (- n 1) (+ x y) (* x y))))))

; LISTES ORDONNEES

(define diviseurs ; -> liste de nb
  (lambda (l n) ; l liste de nb, n nb
    (cond ((null? l) l)
          ((> (car l) n) '())
          ((integer? (/ n (car l))) (cons (car l) (diviseurs (cdr l) n)))
          (else (diviseurs (cdr l) n)))))
