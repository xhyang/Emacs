
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/dict")
(ac-config-default)

(add-to-list 'ac-user-dictionary "475094605@qq.com")

(set-default 'ac-sources
      '(
	ac-source-semantic
        ac-source-yasnippet
        ac-source-dictionary
;;        ac-source-abbrev
        ac-source-words-in-buffer
;;        ac-source-words-in-same-mode-buffers
;;        ac-source-imenu
;;        ac-source-files-in-current-dir
        ac-source-filename))
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")

;;yasnippet补全
(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")
(yas/load-directory yas/root-directory)
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
        yas/ido-prompt
        yas/completing-prompt))

