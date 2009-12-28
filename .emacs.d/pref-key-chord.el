(require 'key-chord nil t)
(eval-after-load "key-chord"
  '(progn
     (setq key-chord-two-keys-delay 0.04)
     (key-chord-mode 1)
     (key-chord-define-global "jk" 'view-mode)
     ))