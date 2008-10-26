(defun my-get-stdout-shell-command (command)
  (interactive)
  (set-buffer "*Shell Command Output*")
  (erase-buffer)
  (call-process command nil "*Shell Command Output*" nil)
  (delete-char -1); delete line break
  (buffer-string))

(defun my-get-stdout-shell-command-arg (command arg)
  (interactive)
  (set-buffer "*Shell Command Output*")
  (erase-buffer)
  (call-process command nil "*Shell Command Output*" nil arg)
  (delete-char -1); delete line break
  (buffer-string))

(get-buffer-create "*Shell Command Output*")