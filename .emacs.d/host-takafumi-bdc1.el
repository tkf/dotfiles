(setq user-mail-address "tkf@rkn")
(if window-system
    (progn ;; if not 'emacs -nw'
      (color-theme-billw)
      ;; for black background color
      (setq py-python-command-args '("-pylab" "-colors" "Linux"))
      )
  )

(cond
 ;; emacs 23
 ((string-match "^23\." emacs-version)
  (load-file-in-dir preferences-directory
		    "host-takafumi-bdc1-ver-23.el"))
 )
