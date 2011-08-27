;;������ı�ǩ�ļ���Ĭ����~/.emacs.bmk
(setq bootmark-default-file "~/.emacs.d/.emacs.bmk")

;;load-path
(setq load-path (cons "~/.emacs.d" load-path))
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(setq load-path (cons "~/.emacs.d/ecb-2.40" load-path))
(setq load-path (cons "~/.emacs.d/session/lisp" load-path))
(setq load-path (cons "~/.emacs.d/cedet-1.0pre7/common" load-path))
(setq load-path (cons "~/.emacs.d/cedet-1.0pre7/cogre" load-path))
(setq load-path (cons "~/.emacs.d/cedet-1.0pre7/contrib" load-path))
(setq load-path (cons "~/.emacs.d/cedet-1.0pre7/srecode" load-path))
(setq load-path (cons "~/.emacs.d/cedet-1.0pre7/ede" load-path))
(setq load-path (cons "~/.emacs.d/cedet-1.0pre7/eieio" load-path))
(setq load-path (cons "~/.emacs.d/cedet-1.0pre7/semantic" load-path))
(setq load-path (cons "~/.emacs.d/cedet-1.0pre7/speedbar" load-path))
(setq load-path (cons "~/.emacs.d/smart-edit" load-path))
(setq load-path (cons "~/.emacs.d/smart-compile" load-path))
(setq load-path (cons "~/.emacs.d/auctex/site-lisp" load-path))
(setq load-path (cons "~/.emacs.d/predictive" load-path))
(setq load-path (cons "~/.emacs.d/emms-3.0" load-path))
(setq load-path (cons "~/.emacs.d/auto-complete-1.3.1" load-path))
(setq load-path (cons "~/.emacs.d/yasnippet-0.6.1c" load-path))
(setq load-path (cons "~/.emacs.d/doxymacs" load-path))


;;16�����ļ��鿴
(require 'hexview-mode)

;;ϵͳ�����ļ�
(load "site-start")

(load "redo")
(global-set-key (kbd "C-.") 'redo)

;;auto add code
(load "auto-insert")

;;smart-compile
(load "c-compile")

;;Calendar ����ʾũ������
;;(load "chinese-calendar")

;;LaTex��չ
(load "latex-units")
(load "pstricks")

;;���ܲ�ȫ
;;(load "predictive")
;;(autoload 'predictive-mode "predictive" "predictive" t)
;;(set-default 'predictive-auto-add-to-dict t)
;;(setq predictive-main-dict 'rpg-dictionary
;;      predictive-auto-learn t
;;      predictive-add-to-dict-ask nil
;;      predictive-use-auto-learn-cache nil
;;      predictive-which-dict t)


;;�����ļ������շ�����ڲ�ͬ���ļ���������
(load "basic-config")
(load "my-calendar")
(load "my-ido")
(load "my-folding")
(load "my-function")
(load "my-dired")
(load "my-program")
(load "my-org")
(load "other-elisp")
(load "my-latex")
(load "my-media")
(load "auto-complete-setting")
(load "flymake-setting")
(load "~/note/my-org.el")

;; ��������Ǵ��ĸ��ط�Ū���ģ��ڱ���~/.emacs�ļ��Զ�����Ϊ.elc�ļ� 
;;Ŀǰֻ�Ƕ�~/.emacs��Ч�������*.el�ļ���û��ȥŪ���Ժ��п��һ�ĵ� 
;;С֪ʶ�����������ļ�Խ��Խ�����*.el�����ļ���ö�����Ϊ*.elc�ļ�������������emacs�ٶȻ��кܴ������ 
(defun autocompile nil 
"compile itself if ~/.emacs"
(interactive) 
(if (string= (buffer-file-name) (concat default-directory ".emacs"))
(byte-compile-file (buffer-file-name)))) 

(add-hook 'after-save-hook 'autocompile)

;;�����������������
;;desktop.el ��һ�����Ա������ϴ�emacs�ر�ʱ��״̬���´�����ʱ�ָ�Ϊ�ϴιرյ�״̬��
(load "desktop")
(desktop-save-mode)
(desktop-read)
;; ---------------------------------------
;; ---------------------------------------
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-command "pdftex")
 '(TeX-command "tex")
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(global-semantic-decoration-mode t nil (semantic-decorate-mode))
 '(global-semantic-highlight-edits-mode t nil (semantic-util-modes))
 '(global-semantic-highlight-func-mode t nil (semantic-util-modes))
 '(global-semantic-idle-completions-mode t nil (semantic-idle))
 '(global-semantic-idle-scheduler-mode t nil (semantic-idle))
 '(global-semantic-idle-summary-mode t nil (semantic-idle))
 '(global-semantic-mru-bookmark-mode t nil (semantic-util-modes))
 '(global-semantic-show-parser-state-mode t nil (semantic-util-modes))
 '(global-semantic-show-unmatched-syntax-mode t nil (semantic-util-modes))
 '(global-semantic-stickyfunc-mode t nil (semantic-util-modes))
 '(global-semanticdb-minor-mode t)
 '(global-senator-minor-mode t nil (senator))
 '(semantic-dump-parse t)
 '(semantic-idle-scheduler-verbose-flag t nil (semantic-idle))
 '(semantic-idle-scheduler-working-in-modeline-flag t)
 '(semantic-lex-spp-use-headers-flag t)
 '(semantic-tag-folding-highlight-tags-shown-by-reveal-mode t)
 '(semantic-tag-folding-show-tooltips t)
 '(semanticdb-global-mode t nil (semanticdb))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode (quote (only . t)))
 '(which-function-mode t))
;; '(org-agenda-files (quote ("~/org/work.org")))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "darkslategrey" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Courier New")))))

