;; version management
(setq preferences-directory "~/.emacs.d/")

(defun load-file-in-dir (dir file)
  (load (concat dir file)))

(cond
 ((string-match "^23\." emacs-version)
  (load-file-in-dir preferences-directory "init23.el"))
 )
; emacs-major-version

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
;======================================================================
; Anthy
;    CTRL-\で入力モード切替え
;======================================================================
(load-library "anthy")
(setq default-input-method "japanese-anthy")
;;
;=======================================================================
;フォント
;=======================================================================
;(cond (window-system
;	(set-default-font "-*-fixed-medium-r-normal--14-*-*-*-*-*-*-*")
;       (progn
;         (set-face-font 'default
;                        "-shinonome-gothic-medium-r-normal--14-*-*-*-*-*-*-*")
;         (set-face-font 'bold
;                        "-shinonome-gothic-bold-r-normal--14-*-*-*-*-*-*-*")
;         (set-face-font 'italic
;                        "-shinonome-gothic-medium-i-normal--14-*-*-*-*-*-*-*")
;         (set-face-font 'bold-italic
;                        "-shinonome-gothic-bold-i-normal--14-*-*-*-*-*-*-*")
;       )))
;;
;=======================================================================
;フレームサイズ・位置・色など
;=======================================================================
;(setq initial-frame-alist
;	(append (list
;		   '(foreground-color . "white")		;; 文字色
;		   '(background-color . "#333366")		;; 背景色
;		   '(border-color . "black")
;		   '(mouse-color . "white")
;		   '(cursor-color . "white")
;		   '(width . 90)				;; フレームの幅
;		   '(height . 49)				;; フレームの高さ
;		   '(top . 0)					;; Y 表示位置
;		   '(left . 340)				;; X 表示位置
;		   )
;		initial-frame-alist))
;(setq default-frame-alist initial-frame-alist)
;;
;=======================================================================
; Misc
;=======================================================================
(mouse-wheel-mode)						;;ホイールマウス
(global-font-lock-mode t)					;;文字の色つけ
(setq line-number-mode t)					;;カーソルのある行番号を表示
(auto-compression-mode t)					;;日本語infoの文字化け防止
(set-scroll-bar-mode 'right)					;;スクロールバーを右に表示
;(global-set-key "\C-z" 'undo)					;;UNDO
(setq frame-title-format					;;フレームのタイトル指定
	(concat "%b - emacs@" system-name))

;(display-time)							;;時計を表示
(global-set-key "\C-h" 'backward-delete-char)			;;Ctrl-Hでバックスペース
;(setq make-backup-files nil)					;;バックアップファイルを作成しない
;(setq visible-bell t)						;;警告音を消す
;(setq kill-whole-line t)					;;カーソルが行頭にある場合も行全体を削除
;(when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace t))	;;行末のスペースを強調表示

;=======================================================================
; window move
;=======================================================================
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

;=======================================================================
; user config
;=======================================================================
(setq user-full-name "ARAKAKI, Takafumi")

;=======================================================================
; pstricks
;=======================================================================
; dvips
(defun my-dvips nil
  (interactive)
  (shell-command 
   (concat "dvips " (substring (buffer-name) 0 -4) ".dvi -o" (substring (buffer-name) 0 -4) ".ps")))
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

(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

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

;=======================================================================
; windows.el
;=======================================================================
;; windows.el
(require 'windows)
(win:startup-with-window)
(define-key ctl-x-map "C" 'see-you-again)

;; revive.el
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)

;=======================================================================
;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;=======================================================================
;; yaml-mode
;=======================================================================
(add-hook 'yaml-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil)))
(require 'yaml-mode)

;=======================================================================
;; django-mode
;=======================================================================
(require 'django-mode)

;=======================================================================
;; misc
(setq truncate-partial-width-windows nil)

;=======================================================================
;; rst-mode
;=======================================================================
;(autoload 'rst-mode "rst-mode" "mode for editing reStructuredText documents" t)
;(setq auto-mode-alist
;      (append '(("\\.rst$" . rst-mode)
;		("\\.rest$" . rst-mode)) auto-mode-alist))
;; auto line break with width of 75
;(setq fill-column 77)
;(setq rst-mode-hook 'turn-on-auto-fill)

(require 'rst)
(setq auto-mode-alist
      (append '(;("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))
(add-hook 'text-mode-hook 'rst-text-mode-bindings)


;=======================================================================
;; yas
;=======================================================================
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.5.5")
(require 'yasnippet)
(add-to-list 'yas/extra-mode-hooks
             'rst-mode-hook)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.5.5/snippets/")


; sdic (eijiro)
(global-set-key "\C-cw" 'sdic-describe-word)


(put 'upcase-region 'disabled nil)

; color-theme
(require 'color-theme)
(color-theme-initialize)

;; load setting file (switch by hostname)
(setq hostname (my-get-stdout-shell-command "hostname"))
(setq host-setting-file
      (concat preferences-directory "host-" hostname ".el"))
(load host-setting-file)
