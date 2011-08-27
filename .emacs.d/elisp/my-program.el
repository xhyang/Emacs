
;; load up abbrevs for these modes
(require 'msf-abbrev)
(setq msf-abbrev-verbose t) ;; optional
(setq msf-abbrev-root "~/.emacs.d/mode-abbrevs")
(global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
(global-set-key (kbd "C-c a") 'msf-abbrev-define-new-abbrev-this-mode)
(msf-abbrev-load)

(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hide-ifdef-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

(global-set-key [(f6)] 'gdb)
(setq gdb-many-windows t)

;; load up modes I use
(require 'cc-mode)
(require 'perl-mode)
(require 'cperl-mode)
(require 'sh-script)
(require 'shell)
;;(require 'tex-site) ;; I use AUCTeX
;;(require 'latex)    ;; needed to define LaTeX-mode-hook under AUCTeX
;;(require 'tex)      ;; needed to define TeX-mode-hook under AUCTeX
;; (require 'python)   ;; I use python.el from Emacs CVS, uncomment if you do also

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;����CEDET�ĸ������
;; Load CEDET
(require 'cedet)

;; Key bindings
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-cd" 'semantic-ia-fast-jump)
  (local-set-key "\C-cr" 'semantic-symref-symbol)
  (local-set-key "\C-cR" 'semantic-symref))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;; ������"."��">"ʱ������һ���������г��ṹ�����ĳ�Ա
(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;;���ӻ���ǩ
(enable-visual-studio-bookmarks)

;;Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;;Select one of the following
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

(global-ede-mode t)
;;semantic�����۵�
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))

;;����session
(require 'session)
;;(add-hook 'after-init-hook 'session-initialize) ;; ����ʱ��ʼ��session

;; ���� Emacs Code Browser
(require 'ecb)

(global-set-key [f12] 'ecb-activate) ;;����F12��Ϊ����ecb
(global-set-key [C-f12] 'ecb-deactivate) ;;����Ctrl+F12Ϊֹͣecb
(setq ecb-tip-of-the-day nil)

;;����Sementic�ļ�����Χ
(setq semanticdb-project-roots 
	  (list
        (expand-file-name "/")))

(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
 	  (hippie-expand nil)
 	  (indent-for-tab-command))
)
 
;;�����Զ���ȫ
(global-set-key [(control tab)] 'my-indent-or-complete)
;;(global-set-key [(tab)] 'my-indent-or-complete)
(global-set-key [(meta ?/)] 'semantic-ia-complete-symbol-menu)
(global-set-key [(meta return)] 'semantic-ia-complete-symbol-menu) ;;����Alt+EnterΪ�Զ���ȫ�˵�

;;doxymacs����ע��
(require 'doxymacs)
(defun my-doxymacs-font-lock-hook ()
    (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
        (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(add-hook 'c-mode-common-hook 'doxmacs-mode)
(add-hook 'c++-mode-common-hook 'doxmacs-mode)

;; ---------------------------------------
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
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
 '(semanticdb-global-mode t nil (semanticdb))
 '(semantic-idle-scheduler-verbose-flag t nil (semantic-idle))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(transient-mark-mode (quote (only . t)))
 '(which-function-mode t))

;;����C���Է��
(add-hook 'c-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) ) ;;����C����Ĭ�ϸ�ʽ
(add-hook 'c++-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) ) ;;����C++����Ĭ�ϸ�ʽ
(setq c-basic-offset 2)
(setq show-paren-style 'parentheses) ;; 
(global-set-key [?\S- ] 'set-mark-command) ;; 

(global-set-key [(f4)] 'speedbar)

;;shell,gdb�˳����Զ��رո�buffer
(add-hook 'shell-mode-hook 'mode-hook-func)
(add-hook 'gdb-mode-hook 'mode-hook-func)
(defun mode-hook-func ()
(set-process-sentinel (get-buffer-process (current-buffer))
#'kill-buffer-on-exit)
)

(defun kill-buffer-on-exit (process state)
(message "%s" state)
(if (or
(string-match "exited abnormally with code.*" state)
(string-match "finished" state))
(kill-buffer (current-buffer)))) 

;;����CSCOPE
;;(setq cscope-do-not-update-database t)
(add-hook 'c-mode-common-hook
	  '(lambda()
	     (require 'xcscope)))

;;����svn
(require 'psvn)


