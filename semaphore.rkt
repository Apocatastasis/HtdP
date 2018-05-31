;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname semaphore) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define SAMPLE-CIRCLE1  (circle 3 "solid" "red"))
(define SAMPLE-CIRCLE2  (circle 2 "solid" "yellow"))
(define SAMPLE-SCENE1 (empty-scene 9 9))
(define SAMPLE-SCENE2 (empty-scene 6 6))
(define SAMPLE-SCENE1-CENTER 4.5)
(define SAMPLE-SCENE2-CENTER 3)
  

(define (scene s)
  (empty-scene (* s 3) (* s 3)))
(check-expect (scene 3) SAMPLE-SCENE1)
(check-expect (scene 2) SAMPLE-SCENE2)

(define (s-circle s c)
  (circle s "solid" c))
(check-expect (s-circle 3 "red") SAMPLE-CIRCLE1)
(check-expect (s-circle 2 "yellow") SAMPLE-CIRCLE2)

(define (show-semaphore cir sc)
  (place-image cir (/ (image-width sc) 2) (/ (image-height sc) 2) sc))
(check-expect
 (show-semaphore SAMPLE-CIRCLE1 SAMPLE-SCENE1)
 (place-image SAMPLE-CIRCLE1 SAMPLE-SCENE1-CENTER SAMPLE-SCENE1-CENTER SAMPLE-SCENE1))
(check-expect
 (show-semaphore SAMPLE-CIRCLE2 SAMPLE-SCENE2)
 (place-image SAMPLE-CIRCLE2 SAMPLE-SCENE2-CENTER SAMPLE-SCENE2-CENTER SAMPLE-SCENE2))

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

(define (toc d)
  (cond [(> 0 d) (- d 1)]
        [else d]))

  

(define (main s c)
  (show-semaphore (s-circle s c) (scene s)))
              

              