
;;To make sure files with extension .org use Org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;The most basic logging is to keep track of when a certain TODO item was finished.
(setq org-log-done 'time)

;;turn the entry back into a TODO item through further state cycling, that line will be removed again.
(setq org-log-done 'note)


(defun org-summary-todo (n-done n-not-done)
  "Swith entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging.
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

;; turn on soft wrapping mode for org mode
(add-hook 'org-mode-hook
  (lambda () (setq truncate-lines nil)))

(defun my-indent-org-complete ()
   (interactive)
   (if (looking-at "\\>")
 	  (hippie-expand nil)
 	  (indent-for-tab-command))
)
 
;;设置自动补全
(global-set-key (kbd "C-`") 'my-indent-org-complete)
