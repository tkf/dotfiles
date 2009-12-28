(setq TeX-japanese-process-input-coding-system 'euc-jp
      TeX-japanese-process-output-coding-system 'euc-jp)

(load "auctex.el" t)
(eval-after-load "auctex.el"
  '(progn
     (load "preview-latex.el" nil t t)
     ;; 日本語 TeX 用の設定
     (setq TeX-default-mode 'japanese-latex-mode)
     ;;; 以下、必要に応じて追加して下さい。 
     ;; jsarticle を標準のクラスにする (デフォールトは jarticle)
     (setq japanese-LaTeX-default-style "jsarticle")
     ;; NTT jTeX を使う (デフォールトは pTeX)
     (setq japanese-TeX-command-default "jTeX")
     ;; preview-latex で dvipng を使う
     (setq preview-image-type 'dvipng)

     (setq TeX-parse-self t)

     ;; no "sections"
     (setq preview-default-option-list
	   (quote
	    ("displaymath" "floats" "graphics" "textmath" "footnotes")
	    ))
     ))

;(setq-default TeX-master nil)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
		'("DviPdfMx" "dvipdfmx %s" TeX-run-command nil t)
		)
  )
