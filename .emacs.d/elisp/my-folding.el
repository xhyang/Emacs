;;小知识：autoload和load相比，前者是在需要时启动folding.el，而在emacs启动时只加载这个函数名而已，也就是让Emacs知道有这个函数。而是用load，则在Emacs启动时便加载，如果加载东西很多，emacs启动会很慢。 
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

;;修改folding.el默认的快捷键，以方便自己使用 
;;我大部分的快捷键在最后一帖中将会讲到 
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

;;设定各个模式下，折叠的具体内容和方式 
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
