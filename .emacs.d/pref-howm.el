(setq howm-ref-header ":See-also:") ;; default: >>>
(setq howm-keyword-header ":Keywords:") ;; default: <<<

(setq howm-remember-first-line-to-title t)
(setq howm-template
"%title%cursor
==============================================================================

:Date: %date
%file
")
(setq howm-template-file-format ":See-also: %s\n")
;(setq howm-view-title-header "")
(setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.rest")
; '.rest' then *howmS* looking won't messed up

(setq howm-list-title-regexp  "^.+\n=\\{10\\}")  ;; C-, a
(setq howm-menu-recent-regexp "^.+\n=\\{10\\}")  ;; %recent in menu

(add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
(require 'howm-mode)
