;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname moving-car-sin) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH-OF-WORLD 200)
(define HEIGHT-OF-WORLD 50)
(define WHEEL-RADIUS 3)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define WHEEL-DIAMETER (* WHEEL-RADIUS 2))
(define CAR-MIDDLE (* WHEEL-RADIUS 3))

(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define BACKGROUND
  (place-image TREE 30 30 (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD) ))
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define LOWER-CHASIS
  (rectangle (* WHEEL-RADIUS 6) WHEEL-DIAMETER "solid" "red"))
(define UPPER-CHASIS
  (rectangle (* WHEEL-RADIUS 4) WHEEL-DIAMETER "solid" "red"))
(define SPACE
  (rectangle WHEEL-DIAMETER WHEEL-DIAMETER "outline" "white"))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))
(define CAR
  (above UPPER-CHASIS LOWER-CHASIS  BOTH-WHEELS))



; An AnimationState is a Number.
; interpretation the number of clock ticks 
; since the animation started
 
; AnimationState -> Image
; places the image of the car moving according to time from 
; the left margin of the BACKGROUND image 
(define (render as)
  (place-image CAR (+ as CAR-MIDDLE) (+ (/ HEIGHT-OF-WORLD 2)  (* 10 (sin (/ as 10))))  BACKGROUND))


; AnimationState -> WorldState
; adds 3 to x to move the car right 
(define (tock as)
  (+ as 1))


;WorldState -> boolean
;determine if the program must end
(define (end? as)
  (> as WIDTH-OF-WORLD))

(check-expect (end? 0) #false)
(check-expect (end? 100) #false)
(check-expect (end? 201) #true)


; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [stop-when end?]))
