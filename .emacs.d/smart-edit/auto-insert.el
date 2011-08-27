
;; auto-insert stuff
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-query nil) ;; don't ask, just do it.
(setq auto-insert-directory "~/.emacs.d/TEMPLATE/")
(setq auto-insert-alist
      '(
	("\\.cpp$" . ["c-template.c" auto-update-c-source-file])
	("\\.h$"   . ["c-template.h" auto-update-header-file])
	("\\.c$" . ["c-template.c" auto-update-c-source-file])
	))
(setq auto-insert 'other)

;; function replaces the string '@@@' by the current file
;; name. You could use a similar approach to insert name and date into
;; your file.
(defun auto-update-header-file ()
  (save-excursion
    ;; Replace HHHH with file name sans suffix
    (while (search-forward "HHHH" nil t)
      (save-restriction
	(narrow-to-region (match-beginning 0) (match-end 0))
	(replace-match (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".h") t
		       )
	))
    )
  (save-excursion
    ;; Replace @@@ with file name
    (while (search-forward "@@@" nil t)
      (save-restriction
	(narrow-to-region (match-beginning 0) (match-end 0))
	(replace-match (file-name-nondirectory buffer-file-name))
	))
    )
  (save-excursion
    ;; replace DDDD with today's date
    (while (search-forward "DDDD" nil t)
      (save-restriction
	(narrow-to-region (match-beginning 0) (match-end 0))
	(replace-match "")
	(insert-today)
	))
    )
  )

(defun insert-today ()
  "Insert today's date into buffer"
  (interactive)
  (insert (format-time-string "%A, %B %e %Y" (current-time))))

(defun auto-update-c-source-file ()
  (save-excursion
    ;; Replace HHHH with file name sans suffix
    (while (search-forward "HHHH" nil t)
      (save-restriction
	(narrow-to-region (match-beginning 0) (match-end 0))
	(replace-match (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".h") t
		       )
	))
    )
  (save-excursion
    ;; Replace @@@ with file name
    (while (search-forward "@@@" nil t)
      (save-restriction
	(narrow-to-region (match-beginning 0) (match-end 0))
	(replace-match (file-name-nondirectory buffer-file-name))
	))
    )
  (save-excursion
    ;; replace DDDD with today's date
    (while (search-forward "DDDD" nil t)
      (save-restriction
	(narrow-to-region (match-beginning 0) (match-end 0))
	(replace-match "")
	(insert-today)
	))
    )
  )
