;;�趨��ʾ�ļ��Ĳ��������岻�ǵ��ˣ��Ժ��ټ��� 
(setq dired-listing-switches "-vl") 
;;�����ƺ�ɾ��ʱ���ļ�������������һ����� 
(setq dired-recursive-copies t) 
(setq dired-recursive-deletes t) 
;;cvsʱ��һ��������� 
(setq cvs-dired-use-hook 'always) 
;;��Ҫ������ϸ���õĵط� 
;;�����ض����ļ�����ʲô����� 
;;��ס���ã���������enter����enter����ʾ�༭��ͬv 
;;��ס�ں������&��Ϊ��̨���У����ǻ�Ҫ��Emacs����������� 
;;������ļ��õ���������ʽ��Ҫ������ 
(add-hook 'dired-load-hook 
(function (lambda () 
;;��ס����Ҫ������һ���й��ļ��������İ�dired-x.el�������dired����չ���ǳ�ǿ�� 
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
;;���Ҳ���ˣ������ǲ�������Ե�ĳЩ�ļ� 
;;��������Щ�ļ��������� 
(add-hook 'dired-mode-hook 
(function (lambda () 
(setq dired-omit-files-p nil) 
)))
