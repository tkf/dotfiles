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
