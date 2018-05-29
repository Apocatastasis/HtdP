;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname gauge) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define happiness 100)
(define WORLD-WIDTH 100)
(define WORLD-HEIGHT 25)
(define WORLD
  (empty-scene WORLD-WIDTH WORLD-HEIGHT))
  
(define (show-gauge happiness)
  (place-image (rectangle happiness WORLD-HEIGHT "solid" "red") (/ happiness 2) (/ WORLD-HEIGHT 2) WORLD ))

(define (tock happiness)
  (if (> happiness 0)
     (- happiness 0.1)
      happiness))

(define (key happiness a-key)
  (cond
    [(key=? a-key "up") (+ happiness  1/3)]
    [(key=? a-key "down") (+ happiness 1/5)]
    [else happiness]))
  

(define (gauge-prog happiness)
  (big-bang happiness
    [to-draw show-gauge]
    [on-tick tock]
    [on-key key]))