;;С֪ʶ��autoload��load��ȣ�ǰ��������Ҫʱ����folding.el������emacs����ʱֻ����������������ѣ�Ҳ������Emacs֪�������������������load������Emacs����ʱ����أ�������ض����ܶ࣬emacs����������� 
(autoload 'folding-mode "folding" 
"Minor mode that simulates a folding editor" t) 
(load-library "folding") 
(defun folding-mode-find-file-hook () 
"One of the hooks called whenever a `find-file' is successful." 
(and (assq 'folded-file (buffer-local-variables)) 
folded-file 
(folding-mode 1) 
(kill-local-variable 'folded-file))) 
(setq fold-fold-on-startup t) 
(folding-mode-add-find-file-hook) 

;;�޸�folding.elĬ�ϵĿ�ݼ����Է����Լ�ʹ�� 
;;�Ҵ󲿷ֵĿ�ݼ������һ���н��ὲ�� 
(setq fold-keys-already-setup nil) 
(add-hook 'folding-mode-hook 
(function (lambda() 
(unless fold-keys-already-setup 
(setq fold-keys-already-setup t) 
(define-prefix-command 'ctl-f-folding-mode-prefix) 
(define-key 'ctl-f-folding-mode-prefix "f" 'fold-fold-region) 
(define-key 'ctl-f-folding-mode-prefix "e" 'fold-enter) 
(define-key 'ctl-f-folding-mode-prefix "x" 'fold-exit) 
(define-key 'ctl-f-folding-mode-prefix "b" 'fold-whole-buffer) 
(define-key 'ctl-f-folding-mode-prefix "o" 'fold-open-buffer) 
(define-key 'ctl-f-folding-mode-prefix "h" 'fold-hide) 
(define-key 'ctl-f-folding-mode-prefix "s" 'fold-show) 
(define-key 'ctl-f-folding-mode-prefix "t" 'fold-top-level) 
(define-key 'ctl-f-folding-mode-prefix "f" 'fold-fold-region) 
) 
(local-set-key "C-f" 'ctl-f-folding-mode-prefix)))) 

;;�趨����ģʽ�£��۵��ľ������ݺͷ�ʽ 
(fold-add-to-marks-list 'sgml-mode 
"<!-- {" 
"<!-- } -->" " --> ") 
(fold-add-to-marks-list 'c-mode "/* <" "/* > */" "*/") 
(fold-add-to-marks-list 'c++-mode 
"//<" "//>" "") 
(fold-add-to-marks-list 'LaTeX-mode "%%% {{{" "%%% }}}" " ") 
(fold-add-to-marks-list 'latex2e-mode "%%% {{{" "%%% }}}" " ") 
(fold-add-to-marks-list 'latex-mode "%%%% {{{" "%%%% }}}" " ") 
(fold-add-to-marks-list 'BibTeX-mode "%%% {{{" "%%% }}}" " ") 
(fold-add-to-marks-list 'lisp-mode ";;; {" ";;; }" "") 
(fold-add-to-marks-list 'lex-mode" /* {{{ " " /* }}} */ " "*/") 
(fold-add-to-marks-list 'html-mode "<!-- { " "<!-- } -->" "-->") 
(fold-add-to-marks-list 'shell-script-mode "# {{{" "# }}}" nil) 
(fold-add-to-marks-list 'sh-mode "# {{{ " "# }}}" nil)
