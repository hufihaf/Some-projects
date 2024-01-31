;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname SimonGame) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
;Simon:
;  Description:
;  memory game, in which player must remember a sequence of colors that light up on the screen.
;
;      If the player succeeds, the next level includes same sequence
;        with one more color added to the end of the sequence.
;      If the player fails in reproducing the sequence, the game ends.
;      Score is displayed on-screen.


;GLOBAL VARIABLES
;  background graphics
;  different possible lists of colors
(define BCKGRND
  (overlay (square 730 "solid" "dark slate gray")
           (square 800 "solid" "dim gray")))                                  
(define CLRS (list "dodger blue" "red" "gold" "lime green"))
(define ALL (list "light sky blue" "tomato" "yellow" "chartreuse"))
(define BLUE (list "light sky blue" "red" "gold" "lime green"))
(define RED (list "dodger blue" "tomato" "gold" "lime green"))
(define YELLOW (list "dodger blue" "red" "yellow" "lime green"))
(define GREEN (list "dodger blue" "red" "gold" "chartreuse"))


;STRUCTS
;  Ws: StructOf(ListOf(ListOf(String)) x Number x Number x Bool x Number x Bool)
;    S: sequence of colors (ListOf(ListOf(String))
;    SS: stored sequence of colors
;    R: true = computer's turn, false = player's turn
;    W: points scored / current level
;    L: game over status
(define-struct Ws [S SS R W L])


;FUNCTIONS
;  computer-start: Ws x ListOf(ListOf(String)) -> Ws
;    Ws for the start of computer's turn
;    n is (default color list) x (color list), to simulate blinking color
(define computer-start
  (lambda (ws n)
    (make-Ws (append (Ws-SS ws) n)
             (append (Ws-SS ws) n)
             true
             (+ (Ws-W ws) 1)
             false)))

;  player-start: Ws -> Ws
;    Ws for the start of the player's turn
(define player-start
  (lambda (ws) (make-Ws (Ws-SS ws)
                        (Ws-SS ws)
                        false
                        (Ws-W ws)
                        false)))

;  render: Ws -> Image
(define render
  (lambda (ws)
    (game-over-status ws (draw-score ws (simon ws)))))

;  draw-score: Ws x Image -> Image
;    ws is the Ws struct
;    img is BCKGRND, with simon game
(define draw-score
  (lambda (ws img)
    (overlay/align "middle"
                 "top"
                 (beside (text "SCORE: " 30 "silver")
                         (text (number->string (Ws-W ws)) 30 "silver"))
                 img)))

;  game-over-status: Ws x Image -> Image
;    displays center text on screen
;      "SIMON" or "GAME OVER", depending on status
(define game-over-status
  (lambda (ws img)
    (overlay
     (if (Ws-L ws)
        (text "GAME OVER" 35 "silver")
        (text "SIMON" 35 "silver"))
     img)))
 
;  simon: Ws -> Image
;    draws game board
(define simon
  (lambda (ws)
    (overlay (rectangle 40 619 "solid" "black")
             (overlay (rectangle 619 40 "solid" "black")
                      (overlay
                       (circle 135 "solid" "black")
                       (overlay/xy (rotate -90 (wedge 270 90 "solid" (first (first (Ws-S ws)))))
                                   -400 -400
                                   (overlay/xy
                                    (wedge 270 90 "solid" (second (first (Ws-S ws))))
                                    -400 -130
                                    (overlay/xy
                                     (rotate 180 (wedge 270 90 "solid" (third (first (Ws-S ws)))))
                                     -130 -400
                                     (overlay/xy (rotate 90 (wedge 270 90 "solid" (fourth (first (Ws-S ws)))))
                                                 -130 -130
                                                 (overlay
                                                  (circle 310 "solid" "black")
                                                  BCKGRND))))))))))

;  color-picker: Number -> ListOf(String)
(define color-picker
  (lambda (n)
    (cond
      [(= n 1) (list CLRS BLUE)]
      [(= n 2) (list CLRS RED)]
      [(= n 3) (list CLRS YELLOW)]
      [(= n 4) (list CLRS GREEN)]
      [else (list CLRS ALL)])))
(define FIRST_COLOR (color-picker (random 1 5)))

;  tick: Ws -> Ws
;    checks status of sequence and which turn is occuring - acts accordingly
(define tick
  (lambda (ws)
    (cond
      [(and (Ws-R ws) (empty? (rest (Ws-S ws))))
       (player-start ws)]
      [(and (Ws-R ws) (not (empty? (rest (Ws-S ws)))))
       (make-Ws (rest (Ws-S ws)) (Ws-SS ws) true (Ws-W ws) false)]
      [else ws]
      )))


;MOUSE FUNCTIONS
;  which-color-clicked?: Number x Number -> ListOf(ListOf(String))
;    mx is the mouse x value
;    my is the mouse y value
(define which-color-clicked?
  (lambda (mx my)
    (cond
      [(and (and (>= mx 400) (<= mx 670)) (and (>= my 400) (<= my 670))) BLUE]
      [(and (and (>= mx 400) (<= mx 670)) (and (>= my 130) (<= my 400))) RED]
      [(and (and (>= mx 130) (<= mx 400)) (and (>= my 400) (<= my 670))) YELLOW]
      [(and (and (>= mx 130) (<= mx 400)) (and (>= my 130) (<= my 400))) GREEN]
      [else CLRS]
      )))

;  clicked?: Number x Number -> String
;    mx is mouse x value
;    my is mouse y value
;      checks if player clicked the correct color, incorrect color, or misclicked
(define clicked?
  (lambda (ws mx my)
    (cond
      [(equal? (which-color-clicked? mx my) (first (rest (Ws-S ws)))) "y"]
      [(equal? (which-color-clicked? mx my) CLRS) "n/a"]
      [else "n"])))

;  MouseHandler: WS x Number x Number x String -> WS
;    ws is the Ws struct
;    mx is the mouse x value
;    my is the mouse y value
;    m_event is the mouse input - must be "button-down" to count as click
(define MouseHandler
  (lambda (ws mx my m_event)
    (if (not (Ws-R ws))
        (if (string=? m_event "button-down")
            (cond
              [(and (string=? (clicked? ws mx my) "y") (not (empty? (rest (rest (Ws-S ws))))))
               (make-Ws (rest (rest (Ws-S ws))) (Ws-SS ws) false (Ws-W ws) false)]
              [(and (string=? (clicked? ws mx my) "y") (empty? (rest (rest (Ws-S ws)))))
               (computer-start ws (color-picker (random 1 5)))]
              [(string=? (clicked? ws mx my) "n")
               (make-Ws (Ws-S ws) (Ws-SS ws) false (Ws-W ws) true)]
              [else ws]
              )
            ws)
        ws)))


;INITIAL WS
;  Initial Ws
(define initial-ws (make-Ws
                    FIRST_COLOR
                    FIRST_COLOR
                    true
                    0
                    false))

;  big-bang: starts the world program
(big-bang initial-ws
  (on-tick tick 0.35)
  (to-draw render)
  (on-mouse MouseHandler)
  (name "SIMON")
  (stop-when Ws-L render))