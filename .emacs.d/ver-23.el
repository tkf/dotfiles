(set-default-font "VL Gothic")
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
	 font-lock-variable-name-face
	 font-lock-type-face
	 font-lock-constant-face
	 ;; org-mode
	 org-level-2 org-level-3 org-level-4
	 org-level-5 org-level-6 org-level-7 org-level-8
	 org-todo org-done
	 ;;
	 sdic-face
	 ))
  (while fontset-list
    (set-face-font (car fontset-list) my-default-font)
    (setq fontset-list (cdr fontset-list))))
(my-font-lock-face-reset)

;; Return face used at point
(defun describe-face-at-point ()
  "Return face used at point."
  (interactive)
  (message "%s" (get-char-property (point) 'face)))

