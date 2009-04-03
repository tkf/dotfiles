;; version management
(setq preferences-directory "~/.emacs.d/")

(defun load-file-in-dir (dir file)
  (load (concat dir file)))

;; library
(setq my-site-lisp-path
      (concat preferences-directory "site-lisp/"))
(add-to-list 'load-path my-site-lisp-path )
(add-to-list 'load-path (concat my-site-lisp-path "color-theme-6.6.0/") )

;; mylib
(setq mylib-path
      (concat preferences-directory "mylib/"))
(load (concat mylib-path "mylib.el"))

;======================================================================
; 言語・文字コード関連の設定
;======================================================================
(when (equal emacs-major-version 21) (require 'un-define))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
;;
;=======================================================================
; Misc
;=======================================================================
(mouse-wheel-mode);;ホイールマウス
(global-font-lock-mode t);;文字の色つけ
(setq line-number-mode t);;カーソルのある行番号を表示
(auto-compression-mode t);;日本語infoの文字化け防止
(set-scroll-bar-mode 'right);;スクロールバーを右に表示
(setq frame-title-format;;フレームのタイトル指定
	(concat "%b - emacs@" system-name))

;(display-time)	;;時計を表示
(global-set-key "\C-h" 'backward-delete-char);;Ctrl-Hでバックスペース
;(setq make-backup-files nil);;バックアップファイルを作成しない
;(setq visible-bell t);;警告音を消す
;(setq kill-whole-line t);;カーソルが行頭にある場合も行全体を削除
;(when (boundp 'show-trailing-whitespace)
;  (setq-default show-trailing-whitespace t));;行末のスペースを強調表示

; copy to/from X clipboard
(setq x-select-enable-clipboard t)

; window move
(windmove-default-keybindings) ; ウィンドウ移動
;(global-set-key "\C-cr" ' windmove-right)
;(global-set-key "\C-cl" 'windmove-left)
;(global-set-key "\C-cd" 'windmove-down)
;(global-set-key "\C-cu" 'windmove-up)
;;
;(global-set-key [end]   'windmove-right)
;(global-set-key [home]  'windmove-left )
;(global-set-key [next]  'windmove-down )
;(global-set-key [prior] 'windmove-up   )

;; C-c c で compile コマンドを呼び出す
(define-key mode-specific-map "c" 'compile)

;;
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
          "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; user config
(setq user-full-name "ARAKAKI, Takafumi")
; 
(setq truncate-partial-width-windows nil)
;
(put 'upcase-region 'disabled nil)

;=======================================================================
;; version control
(cond
 ;; emacs 23
 ((string-match "^23\." emacs-version)
  (load-file-in-dir preferences-directory "ver-23.el"))
 ;; emacs -nw
 (;(not (string-match "dumb" (getenv '"TERM")))
  (not window-system)
  (load-file-in-dir preferences-directory "ver-nw.el"))
 )
; emacs-major-version

;; 
(defun load-directory-files (dir &optional regex)
  (let*
      ((regex (or regex ".+"))
       (files (and
               (file-accessible-directory-p dir)
               (directory-files dir 'full regex))))

    (mapc (lambda (file)
            (when (load file nil t)
              (message "`%s' loaded." file))) files)))

;; for DropBox
(setq auto-save-file-name-transforms
      `((".*/Dropbox/.*" ,temporary-file-directory t)))

;; load preferences.
(load-directory-files preferences-directory "^pref-.+el$")

;; load setting file (switch by hostname)
(setq hostname (my-get-stdout-shell-command "hostname"))
(setq host-setting-file
      (concat preferences-directory "host-" hostname ".el"))
(load host-setting-file)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((TeX-master . t) (TeX-master . "main")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
