;(set-default-font "VL Gothic")
(set-default-font "Bitstream Vera Sans Mono-10")
;tooltipとtabbarのフォント
(set-face-font 'variable-pitch "Bitstream Vera Sans Mono-9")
;複数フレームに対応
(modify-all-frames-parameters (list (assq 'font (frame-parameters))))
;日本語フォント
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("VL Gothic" . "unicode-bmp"))
;変換のタイムラグなしに
(setq anthy-accept-timeout 1)
;YaTeX使うため
(add-to-list 'load-path "/usr/share/emacs/site-lisp/yatex/")
