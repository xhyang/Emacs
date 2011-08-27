;;thumbs.el，看图的好东西，方便看大量的图片 
;;他将图片都建立缩略图，所以第一次看比较慢，以后就方便了 
;;不过我最近不用了，我喜欢用display * 
(require 'thumbs) 

;;tabbar.el，用firefox,opera的人都用过tab，很方便和人性化的一个功能 
;;这里也有，并且按文件的模式分类 
;;对于这个扩展包，我还用了一个绑定键，用来切换buffer，很方便 
;;不过在非X下功能不全 
(require 'tabbar) 
(tabbar-mode)

 ;;不同buffer之间切换
(require 'windmove)
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

 ;;buffer大小调整
(global-set-key [C-M-left] 'enlarge-window-horizontally)
(global-set-key [C-M-right] 'shrank-window-horizontally)
(global-set-key [C-M-up] 'ad-Orig-enlarge-window)
(global-set-key [C-M-down] 'ad-Orig-shrink-window)

;;自动补全括号
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
                   (?` ?` _ "''")
                   (?\( ?  _ " )")
                   (?\[ ?  _ " ]")
                   (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
;;输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等等。
