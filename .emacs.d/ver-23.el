(set-default-font "VL Gothic")
;(set-default-font "Bitstream Vera Sans Mono-10")
;tooltipとtabbarのフォント
;(set-face-font 'variable-pitch "Bitstream Vera Sans Mono-9")
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

;; other fontset
(setq
 my-fontset-varavl
 "-bitstream-bitstream vera sans mono-regular-roman-normal--13-*-*-*-*-*-fontset-myveravl")
(create-fontset-from-fontset-spec my-fontset-varavl)
(set-fontset-font my-fontset-varavl
                  'japanese-jisx0208
                  '("VL Gothic" . "unicode-bmp"))


;;;; for font lock face
(defun my-font-lock-face-reset ()
  "set all font set default font"
  (interactive)
  (setq my-default-font (frame-parameter nil 'font))
  (setq fontset-list'
	(;; --- Add here faces to be set as font which is in frame param
	 variable-pitch fixed-pitch
	 ;; font-lock
	 font-lock-comment-face
	 font-lock-keyword-face
	 font-lock-function-name-face
	 font-lock-doc-face
	 font-lock-string-face
	 font-lock-builtin-face
	 ;; org-mode
	 org-level-2 org-level-3 org-level-4
	 org-level-5 org-level-6 org-level-7 org-level-8
	 org-todo org-done
	 ))
  (while fontset-list
    (set-face-font (car fontset-list) my-default-font)
    (setq fontset-list (cdr fontset-list))))
(my-font-lock-face-reset)

;; ;(setq my-default-font "VL Gothic")
;; (setq my-default-font (frame-parameter nil 'font))
;; ;(set-face-font ' my-default-font)
;; (set-face-font 'variable-pitch my-default-font)
;; (set-face-font 'fixed-pitch my-default-font)
;; ;; font-lock
;; (set-face-font 'font-lock-comment-face my-default-font)
;; (set-face-font 'font-lock-keyword-face my-default-font)
;; (set-face-font 'font-lock-function-name-face my-default-font)
;; (set-face-font 'font-lock-doc-face my-default-font)
;; (set-face-font 'font-lock-string-face my-default-font)
;; (set-face-font 'font-lock-builtin-face my-default-font)
;; ;; org-mode
;; (set-face-font 'org-level-2 my-default-font)
;; (set-face-font 'org-level-3 my-default-font)
;; (set-face-font 'org-level-4 my-default-font)
;; (set-face-font 'org-level-5 my-default-font)
;; (set-face-font 'org-level-6 my-default-font)
;; (set-face-font 'org-level-7 my-default-font)
;; (set-face-font 'org-level-8 my-default-font)
;; (set-face-font 'org-todo my-default-font)
;; (set-face-font 'org-done my-default-font)

;; Return face used at point
(defun describe-face-at-point ()
  "Return face used at point."
  (interactive)
  (message "%s" (get-char-property (point) 'face)))

