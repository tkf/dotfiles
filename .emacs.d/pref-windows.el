;; windows.el
(require 'windows nil t)
(eval-after-load "windows"
  '(progn
     (win:startup-with-window)
     (define-key ctl-x-map "C" 'see-you-again)
     ))

;; revive.el
;(autoload 'save-current-configuration "revive" "Save status" t)
;(autoload 'resume "revive" "Resume Emacs" t)
;(autoload 'wipe "revive" "Wipe emacs" t)
