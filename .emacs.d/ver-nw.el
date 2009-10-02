(define-key function-key-map [27 79 49 59 50 65] [S-up])
(define-key function-key-map [27 79 49 59 50 66] [S-down])
(define-key function-key-map [27 79 49 59 50 67] [S-right])
(define-key function-key-map [27 79 49 59 50 68] [S-left])

; emacsclient
(server-start)

; no menu bar
(menu-bar-mode -1)

;(cond
; ;; mlterm
; ((string-match "mlterm" (getenv '"TERM"))
;  (load-file-in-dir preferences-directory "ver-nw-mlterm.el"))
; ;; screen
; ((string-match "screen" (getenv '"TERM"))
;  (load-file-in-dir preferences-directory "ver-nw-screen.el"))
; )
