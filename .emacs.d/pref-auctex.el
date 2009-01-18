(load "auctex.el" nil t t)
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

(setq-default TeX-master nil)

;; no "sections"
(setq preview-default-option-list
      (quote
       ("displaymath" "floats" "graphics" "textmath" "footnotes")
       ))
