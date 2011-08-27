
;;################### LaTeX ######################
(add-hook 'LaTeX-mode-hook (lambda()
        (define-key LaTeX-mode-map "\C-m" 'reindent-then-newline-and-indent)
))
(setq reftex-plug-into-auctex t)
(global-set-key [f6] 'LaTeX-environment)

;使用pdflatex编译文件
(add-hook 'LaTeX-mode-hook (lambda()
	     (add-to-list 'TeX-command-list '("pdftex" "%`pdftex%(mode)%' %t" TeX-run-TeX nil t))
         (setq TeX-command-default "pdftex")
         (setq TeX-save-query  nil )
         (setq TeX-show-compilation t)))

(require 'tex-mik)
(require 'info-look)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)    
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)    
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;;PDFLaTex
(setq TeX-PDF-mode t)


(defun latex-help-get-cmd-alist () ;corrected version:
  "Scoop up the commands in the index of the latex info manual.
   The values are saved in `latex-help-cmd-alist' for speed."
  ;; mm, does it contain any cached entries
  (if (not (assoc "\\begin" latex-help-cmd-alist))
      (save-window-excursion
  	(setq latex-help-cmd-alist nil)
  	(Info-goto-node (concat latex-help-file "Command Index"))
	(end-of-buffer)
	(while (re-search-backward "^\\* \\(.+\\): *\\(.+\\)\\." nil t)
	  (setq key (ltxh-buffer-substring (match-beginning 1) (match-end 1)))
	  (setq value (ltxh-buffer-substring (match-beginning 2) (match-end 2)))
	  (setq latex-help-cmd-alist
		(cons (cons key value) latex-help-cmd-alist))))
    )
  latex-help-cmd-alist
  )

(info-lookup-add-help
 :mode 'latex-mode
 :regexp ".*"
 :parse-rule "\\\\?[a-zA-Z]+\\|\\\\[^a-zA-Z]"
 :doc-spec '(("(latex2e)Concept Index" )
	     ("(latex2e)Command Index")))


;;(define-abbrev-table 'TeX-mode-abbrev-table (make-abbrev-table))
;;(add-hook 'TeX-mode-hook (lambda ()
;;			   (setq abbrev-mode t)
;;			   (setq local-abbrev-table TeX-mode-abbrev-table)))

(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))

(setq TeX-view-program-list
      '(("SumatraPDF" "SumatraPDF.exe %o")
        ("Gsview" "gsview32.exe %o")
        ("Acroread" "acroread %o")
        ("Okular" "okular --unique %o")
        ("Evince" "evince %o")
        ("Firefox" "firefox %o")))

(cond
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                                 (output-dvi "Yap"))))))
 ((eq system-type 'gnu/linux)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "acroread")
                                                 (output-dvi "acroread")))))))


