(add-to-list 'load-path "~/.emacs.d/yasnippet-0.5.5")
(require 'yasnippet)
(add-to-list 'yas/extra-mode-hooks
             'rst-mode-hook)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.5.5/snippets/")
