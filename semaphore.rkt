;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname semaphore) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))

(define CIRCLE-RADIUS 100)
(define SCENE-LEN (* CIRCLE-RADIUS 3))
(define SAMPLE-CIRCLE1  (circle CIRCLE-RADIUS "solid" "red"))
(define SAMPLE-CIRCLE2  (circle CIRCLE-RADIUS "solid" "yellow"))
(define SCENE (empty-scene SCENE-LEN SCENE-LEN))
(define SCENE-CENTER (/ SCENE-LEN 2))



(define (s-circle s c)
  (circle s "solid" c))
(check-expect (s-circle CIRCLE-RADIUS "red") SAMPLE-CIRCLE1)
(check-expect (s-circle  CIRCLE-RADIUS  "yellow") SAMPLE-CIRCLE2)

(define (show-semaphore s)
  (place-image (s-circle CIRCLE-RADIUS s) SCENE-CENTER SCENE-CENTER SCENE))
(check-expect
 (show-semaphore "red")
 (place-image SAMPLE-CIRCLE1 SCENE-CENTER SCENE-CENTER SCENE))
(check-expect
 (show-semaphore "yellow")
 (place-image SAMPLE-CIRCLE2 SCENE-CENTER SCENE-CENTER SCENE))

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))
  

(define (main s d)
  (big-bang s [to-draw show-semaphore]
    [on-tick traffic-light-next d]))

              

              