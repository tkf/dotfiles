(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-todo-keywords 
      '("TODO" "NEXTACTION" "SOMEDAY" "WAITINGFOR"
	"CALENDAR" "DONE")
      org-todo-interpretation 'type)

(setq org-agenda-files
      (list "~/repos/arataka/org/memo.org"
	    "~/repos/arataka/org/gtd.org"
	    "~/repos/arataka/org/daily.org"
	    ))