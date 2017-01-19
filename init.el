;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes nil)
 '(package-selected-packages
   (quote
    (w3 chinese-pyim-greatdict chinese-pyim chinese-pyim-wbdict helm-dash dash minimap yaml-mode sphinx-doc session rtags python-docstring projectile pdb-mode nose iedit helm goto-chg ggtags flymake-google-cpplint flycheck-irony evil elpy company-quickhelp company-irony-c-headers company-irony cmake-ide auto-complete-c-headers anaconda-mode ace-window ace-jump-mode)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "AR PL UKai CN" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal)))))

(load-file "~/.emacs.d/custom.el")
(load-file "~/.emacs.d/org-mode.el")
(load-file "~/.emacs.d/resetkey.el")
(load-file "~/.emacs.d/pyim.el")
;; (put 'upcase-region 'disabled nil)
