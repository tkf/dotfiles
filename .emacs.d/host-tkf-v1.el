(set-default-font "VL Gothic-6")
; multiple frame
(modify-all-frames-parameters (list (assq 'font (frame-parameters))))

(set-frame-width (selected-frame) 80)

(setq ipython-completion-command-string
      "print(';'.join(__IP.Completer.all_completions('%s')))\n")

(if window-system
    (progn ;; if not 'emacs -nw'
      (color-theme-clarity)
      ;; for black background color
      (setq py-python-command-args '("-pylab" "-colors" "Linux"))
      )
  )

; anthy
(setq anthy-accept-timeout 1)

; maxima
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'maxima "maxima" "Maxima interaction" t)

;; imaxima
(autoload 'imaxima "imaxima" "Frontend of Maxima CAS" t)
(autoload 'imath "imath" "Interactive Math mode" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)
(setq imaxima-fnt-size "small")
