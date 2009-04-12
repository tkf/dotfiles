(setq user-mail-address "tkf@rkn")
(if window-system
    (color-theme-billw);if not 'emacs -nw'
  )

(cond
 ;; emacs 23
 ((string-match "^23\." emacs-version)
  (load-file-in-dir preferences-directory
		    "host-takafumi-bdc1-ver-23.el"))
 )
