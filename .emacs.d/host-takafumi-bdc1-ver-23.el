(set-default-font "VL Gothic-10")
; multiple frame
(modify-all-frames-parameters (list (assq 'font (frame-parameters))))
; Japanese font
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("VL Gothic" . "unicode-bmp"))
; anthy
(setq anthy-accept-timeout 1)
; YaTeX
(add-to-list 'load-path "/usr/share/emacs/site-lisp/yatex/")

; set frame width and height with command
(defun my-frame-4c-s12 ()
  (interactive)
  (set-default-font "VL Gothic-12")
  (set-frame-width (selected-frame) 332)
  (set-frame-height (selected-frame) 56)
  )

(defun my-frame-2c-s12 ()
  (interactive)
  (set-default-font "VL Gothic-12")
  (set-frame-width (selected-frame) 164)
  (set-frame-height (selected-frame) 56)
  )

(defun my-frame-2c-s10 ()
  (interactive)
  (set-default-font "VL Gothic-10")
  (set-frame-width (selected-frame) 166)
  (set-frame-height (selected-frame) 70)
  )

(defun my-frame-1c-s12 ()
  (interactive)
  (set-default-font "VL Gothic-12")
  (set-frame-width (selected-frame) 81)
  (set-frame-height (selected-frame) 56)
  )

(defun my-frame-1c-s10 ()
  (interactive)
  (set-default-font "VL Gothic-10")
  (set-frame-width (selected-frame) 81)
  (set-frame-height (selected-frame) 70)
  )

(defun my-set-font-size (n)
  (interactive "n")
  (set-default-font (concat "VL Gothic-" (number-to-string n))))
