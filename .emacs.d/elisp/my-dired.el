;;设定显示文件的参数，具体不记得了，以后再加上 
(setq dired-listing-switches "-vl") 
;;允许复制和删除时将文件夹里所有内容一起带上 
(setq dired-recursive-copies t) 
(setq dired-recursive-deletes t) 
;;cvs时的一个浏览设置 
(setq cvs-dired-use-hook 'always) 
;;主要可以详细设置的地方 
;;对于特定的文件，用什么程序打开 
;;记住是用！，而不是enter键，enter键表示编辑，同v 
;;记住在后面带上&，为后台运行，我们还要用Emacs做别的事情呢 
;;下面的文件用的是正则表达式，要表达清楚 
(add-hook 'dired-load-hook 
(function (lambda () 
;;记住这里要加载另一个有关文件管理器的包dired-x.el，这个是dired的扩展，非常强大 
(load "dired-x") 
(setq dired-guess-shell-alist-user 
(list 
(list "\\.tar\\.bz2$" "tar jxvf * &") 
'("\\.ps$" "gv * &") 
'("\\.html?$" "rxvt -e w3m * &") 
'("\\.pdf$" "xpdf * &") 
'("\\.\\(jpe?g\\|gif\\|png\\|bmp\\|xbm\\|fig\\|eps\\)$" "display * &") 
'("\\.\\([Ww][Mm][Vv]\\|[Vv][Oo][Bb]\\|[Mm][Pp][Ee]?[Gg]\\|asf\\|[Rr][Aa]?[Mm]\\)$" "mplayer * &") 
)) 
))) 
;;这个也忘了，好像是不允许忽略掉某些文件 
;;到底是哪些文件，我想想 
(add-hook 'dired-mode-hook 
(function (lambda () 
(setq dired-omit-files-p nil) 
)))
