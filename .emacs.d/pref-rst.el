;(autoload 'rst-mode "rst-mode" "mode for editing reStructuredText documents" t)
;(setq auto-mode-alist
;      (append '(("\\.rst$" . rst-mode)
;		("\\.rest$" . rst-mode)) auto-mode-alist))
;; auto line break with width of 75
;(setq fill-column 77)
;(setq rst-mode-hook 'turn-on-auto-fill)

; for dark background. it must be moved to host-*.
(setq frame-background-mode 'dark)

(require 'rst nil t)
(eval-after-load "rst"
  '(progn
     (setq auto-mode-alist
	   (append '(;("\\.txt$" . rst-mode)
		     ("\\.rst$" . rst-mode)
		     ("\\.rest$" . rst-mode)) auto-mode-alist))
     ;(add-hook 'text-mode-hook 'rst-text-mode-bindings)
     ))
