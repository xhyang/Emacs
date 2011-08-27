;;thumbs.el����ͼ�ĺö��������㿴������ͼƬ 
;;����ͼƬ����������ͼ�����Ե�һ�ο��Ƚ������Ժ�ͷ����� 
;;��������������ˣ���ϲ����display * 
(require 'thumbs) 

;;tabbar.el����firefox,opera���˶��ù�tab���ܷ�������Ի���һ������ 
;;����Ҳ�У����Ұ��ļ���ģʽ���� 
;;���������չ�����һ�����һ���󶨼��������л�buffer���ܷ��� 
;;�����ڷ�X�¹��ܲ�ȫ 
(require 'tabbar) 
(tabbar-mode)

 ;;��ͬbuffer֮���л�
(require 'windmove)
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

 ;;buffer��С����
(global-set-key [C-M-left] 'enlarge-window-horizontally)
(global-set-key [C-M-right] 'shrank-window-horizontally)
(global-set-key [C-M-up] 'ad-Orig-enlarge-window)
(global-set-key [C-M-down] 'ad-Orig-shrink-window)

;;�Զ���ȫ����
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
;;������ߵ����ţ��ͻ��Զ���ȫ�ұߵĲ���.����(), "", [] , {} , �ȵȡ�
