;;这个由王垠创作 
;;如果你正在编辑一个东西（在位置A），突然想到别的某处（位置B）要修改或查看或别的，总之你要过去看看，你可以用C-.来在当前位置做个标记，然后去你想去的地方B，看了一会你觉的我可以回A去了，用C-,就回到刚才做标记的地方A，再用C-,又会回到B 

(defun ska-point-to-register() 
"Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position." 
(interactive) 
(setq zmacs-region-stays t) 
(point-to-register 8))


(defun ska-jump-to-register() 
"Switches between current cursorposition and position 
that was stored with ska-point-to-register." 
(interactive) 
(setq zmacs-region-stays t) 
(let ((tmp (point-marker))) 
(jump-to-register 8) 
(set-register 8 tmp)))

(global-set-key (kbd "C-;") 'ska-point-to-register) 
(global-set-key (kbd "C-'") 'ska-jump-to-register) 

