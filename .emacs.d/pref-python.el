;=======================================================================
; python-mode
;=======================================================================
;;
;; エラー対策 : file-error “Cannot open load file” “python-mode”
;; > http://stinkpot.afraid.org:8080/tricks/index.php/2007/01/fixing-emacs-cannot-open-load-file-errors/ より
(add-to-list 'load-path "/usr/share/emacs/site-lisp/python-mode")
;;
;; /usr/share/emacs/site-lisp/python-mode/python-mode.el > INSTKKATION より
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
;;
;(add-hook 'python-mode-hook
;          '(lambda()
;             (require 'pycomplete)
;             (setq indent-tabs-mode nil)))
;(require 'python-mode)
(require 'pycomplete)
(define-key py-mode-map [A-right]  'py-complete)

;=======================================================================
; py-complete
;=======================================================================
;(autoload 'py-complete-init "py-complete")
;(add-hook 'python-mode-hook 'py-complete-init)

;=======================================================================
; ipython
;=======================================================================
;(setq ipython-command "/usr/bin/ipython")
;(add-hook 'python-mode-hook
;          '(lambda()
;             (require 'ipython)
;             (setq indent-tabs-mode nil)))
(setq py-python-command-args '("-pylab"))
(require 'ipython)
