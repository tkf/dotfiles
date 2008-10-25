;; expand template(format string) using array of argument
(defun exptmp-insert-expanded (format-str arg-array)
  (loop for arg in arg-array do
	(insert (apply 'format (cons format-str arg)))
	)
  )

;; get template(format string) in template buffer
(defun exptmp-get-template ()
  (set-buffer exptmp-buffer-name-template)
  (buffer-string)
  )

(setq 
 exptmp-buffer-name-template "*exptmp-template*"
 exptmp-buffer-name-array "*exptmp-array*"
 )

(setq exptmp-buffer-template
      (get-buffer-create exptmp-buffer-name-template)
      )
(setq exptmp-buffer-array
      (get-buffer-create exptmp-buffer-name-array)
      )
