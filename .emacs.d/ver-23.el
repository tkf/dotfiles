(set-default-font "VL Gothic")
;(set-default-font "Bitstream Vera Sans Mono-10")
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


;;;; for font lock face
(setq my-default-font "VL Gothic")
(set-face-font 'font-lock-comment-face my-default-font)
(set-face-font 'font-lock-keyword-face my-default-font)
(set-face-font 'font-lock-function-name-face my-default-font)
(set-face-font 'font-lock-doc-face my-default-font)
(set-face-font 'font-lock-string-face my-default-font)
(set-face-font 'org-level-2 my-default-font)
(set-face-font 'org-level-3 my-default-font)
(set-face-font 'org-level-4 my-default-font)
(set-face-font 'org-level-5 my-default-font)
(set-face-font 'org-level-6 my-default-font)
(set-face-font 'org-level-7 my-default-font)
(set-face-font 'org-level-8 my-default-font)
(set-face-font 'org-todo my-default-font)
(set-face-font 'org-done my-default-font)

;; Return face used at point
(defun describe-face-at-point ()
  "Return face used at point."
  (interactive)
  (message "%s" (get-char-property (point) 'face)))

