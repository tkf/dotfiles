;=======================================================================
;フォント
;=======================================================================
;(cond (window-system
;       (set-default-font "-*-fixed-medium-r-normal--14-*-*-*-*-*-*-*")
;       (progn
;         (set-face-font 
;	  'default
;	  "-shinonome-gothic-medium-r-normal--14-*-*-*-*-*-*-*")
;         (set-face-font 
;	  'bold
;	  "-shinonome-gothic-bold-r-normal--14-*-*-*-*-*-*-*")
;         (set-face-font 
;	  'italic
;	  "-shinonome-gothic-medium-i-normal--14-*-*-*-*-*-*-*")
;         (set-face-font 
;	  'bold-italic
;	  "-shinonome-gothic-bold-i-normal--14-*-*-*-*-*-*-*")
;       )))
;
;=======================================================================
;フレームサイズ・位置・色など
;=======================================================================
;(setq initial-frame-alist
;      (append (list
;	       '(foreground-color . "white")  ;; 文字色
;	       '(background-color . "#333366");; 背景色
;	       '(border-color . "black")
;	       '(mouse-color . "white")
;	       '(cursor-color . "white")
;	       '(width . 90)  ;; フレームの幅
;	       '(height . 49) ;; フレームの高さ
;	       '(top . 0)     ;; Y 表示位置
;	       '(left . 340)  ;; X 表示位置
;	       )
;	      initial-frame-alist))
;(setq default-frame-alist initial-frame-alist)
;;
