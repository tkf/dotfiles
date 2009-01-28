; dvips
(defun my-dvips nil
  (interactive)
  (shell-command 
   (concat "dvips " (substring (buffer-name) 0 -4)
	   ".dvi -o" (substring (buffer-name) 0 -4) ".ps")))
(global-set-key "\C-cps" ' my-dvips )
; evince (PostScript viewer)
(defun my-evince nil
  (interactive)
  (shell-command 
   (concat "evince " (substring (buffer-name) 0 -4) ".ps &")))
(global-set-key "\C-cpp" ' my-evince )
; dvips -E -o output.eps input.dvi
(defun my-dvips-eps nil
  (interactive)
  (setq my-dvips-eps-filename (substring (buffer-name) 0 -4))
  (shell-command 
   (concat "dvips -E -o" my-dvips-eps-filename ".eps "
	      my-dvips-eps-filename ".dvi")))
(global-set-key "\C-cEps" ' my-dvips-eps)
