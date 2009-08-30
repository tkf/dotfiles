(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-todo-keywords 
      '("TODO" "NEXTACTION" "SOMEDAY" "WAITINGFOR"
	"CALENDAR" "DOING" "DONE")
      org-todo-interpretation 'type)

(setq org-agenda-files
      (list "~/memo/projects/go-abroad.org"
	    "~/memo/projects/life.org"
	    "~/memo/projects/res-MtDyRNN.org"
	    "~/memo/projects/res-WkMem.org"
	    "~/memo/projects/study.org"
	    "~/memo/projects/lab-misc.org"
	    ))

(setq org-export-publishing-directory "~/misc/pub_org/")

;(setq org-agenda-files
;      (list "~/repos/arataka/org/memo.org"
;	    "~/repos/arataka/org/gtd.org"
;	    "~/repos/arataka/org/daily.org"
;	    ))

(setq org-tag-persistent-alist '((:startgroup . nil)
		      ("@lab" . ?l) ("@univ" . ?u) ("@home" . ?h)
		      (:endgroup . nil)
		      ("TASK" . ?k)
		      ("PLAN" . ?p) ("TALK" . ?t) ("READING" . ?r)
		      ("PAPER" . ?a) ("MAIL" . ?m)
		      ))
;("" . ?)
