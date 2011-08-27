;; 让 etags 在当前目录和上级目录中搜索 TAGS 文件
(setq tags-table-list '("." ".." "../.."))


(global-set-key (kbd "<f5>") 'smart-compile)
(defun smart-compile()
;; "比较智能的C/C++编译命令如果当前目录有makefile则用make -k编译，否则，如果是处于c-mode，就用gcc-Wall编译，如果是c++-mode就用g++ -Wall编译"
  (interactive)
  ;; 查找 Makefile
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
        (command nil))
    (if (not (null
              (find t candidate-make-file-name :key
                    '(lambda (f) (file-readable-p f)))))
        (setq command "make -k ")
        ;; 没有找到 Makefile ，查看当前 mode 是否是已知的可编译的模式
        (if (null (buffer-file-name (current-buffer)))
            (message "Buffer not attached to a file, won't compile!")
            (if (eq major-mode 'c-mode)
                (setq command
                      (concat "gcc -Wall -o "
                              (file-name-sans-extension
                               (file-name-nondirectory buffer-file-name))
                              " "
                              (file-name-nondirectory buffer-file-name)
                              " -g -lm "))
              (if (eq major-mode 'c++-mode)
                  (setq command
                        (concat "g++ -Wall -o "
                                (file-name-sans-extension
                                 (file-name-nondirectory buffer-file-name))
                                " "
                                (file-name-nondirectory buffer-file-name)
                                " -g -lm "))
                (message "Unknow mode, won't compile!")))))
    (if (not (null command))
        (let ((command (read-from-minibuffer "Compile command: " command)))
          (compile command)))))
          
          
