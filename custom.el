; ==============================================================
; =                     global
; =============================================================
(toggle-truncate-lines -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-set-key (kbd "C--") 'undo)
(global-whitespace-mode)
(diff-mode)
;; 高亮显示匹配括号
(show-paren-mode 1)
;; 新建窗口时显示方式
(setq split-height-threshold 0)
(setq split-width-threshold nil)
;;显示时间
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间栏旁边启用邮件设置
(setq display-time-use-mail-icon t)
;;显示时间的格式
(setq display-time-format "%Y-%m-%d %A %H:%M")
(setq column-number-mode t)
;;字符串替换快捷键
(global-set-key (kbd "M-s M-s") 'replace-string)
;;行号格式
(setq linum-format "%4d ")
(global-linum-mode t)
;; 默认浏览器
(setq browse-url-browser-function 'google-chrome-stable)
(setq scroll-margin 5 scroll-conservatively 10000) ;; 平滑翻页
;; term 粘贴
(add-hook 'term-mode-hook (lambda () (define-key term-raw-map (kbd "C-y") 'term-paste)))
;; 主题
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/monokai")
(load-theme 'monokai t)
; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/molokai-theme")
; (load-theme 'molokai t)
;; (add-to-list 'load-path "~/.emacs.d/themes/color-theme/")
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-tty-dark)
(add-to-list 'load-path "~/.emacs.d/packages")
;; 保存时删除多余的空格和TAB
(global-set-key (kbd "C-x C-s") '(lambda()
			       (interactive)
			       (whitespace-cleanup)
			       (save-buffer)))
;; 任意位置上/下新建一行
(global-set-key (kbd "C-j") '(lambda()
			       (interactive)
			       (move-end-of-line 1)
			       (newline-and-indent)))
(global-set-key (kbd "C-o") '(lambda()
			       (interactive)
			       (beginning-of-line)
			       (open-line 1)
			       (indent-according-to-mode)))


; ==============================================================
; =                     package
; =============================================================
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives
	       '("gnu" . "http://elpa.gnu.org/packages/")
	       ))




; ==============================================================
; =                     anaconda
; =============================================================
(add-hook 'python-mode-hook (lambda ()
			      (require 'sphinx-doc)
			      (sphinx-doc-mode t)))

; ==============================================================
; =                     anaconda
; =============================================================
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

; ==============================================================
; =                     session
; =============================================================
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(when (require 'session nil t)
(add-hook 'after-init-hook 'session-initialize)
(add-to-list 'session-globals-exclude 'org-mark-ring))
(load "desktop")
(require 'desktop)
(setq desktop-save t)
(setq desktop-load-locked-desktop t)
(setq *desktop-dir* (list (expand-file-name "~/.emacs.d/desktop")))
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name ".emacs-desktop")
(desktop-save-mode 1)
(desktop-read)

; ==============================================================
; =                     autopair
; =============================================================
(add-to-list 'load-path "~/.emacs.d/packages/autopair")
(require 'autopair)
(autopair-global-mode)
(add-hook 'js-mode-hook '(lambda () (autopair-mode)))
(add-hook 'sh-mode-hook '(lambda () (autopair-mode)))
(add-hook 'c-mode-hook '(lambda () (autopair-mode)))
(add-hook 'html-mode-hook '(lambda () (autopair-mode)))
(add-hook 'python-mode-hook '(lambda () (autopair-mode)))

; ==============================================================
; =                     python-mode
; =============================================================
(setenv "WORKON_HOME"
	(concat
	 "~/.emacs.d/languages/python")
	)
(setenv "PYTHONPATH" "~/.emacs.d/languages/python/")
(defadvice virtualenv-activate (after virtual-pdb)
  (custom-set-variables
     '(gud-pdb-command-name
       (concat virtualenv-active "/usr/bin/pdb" ))))
(ad-activate 'virtualenv-activate)
(pyvenv-activate "~/.emacs.d/languages/python")
(when (require 'elpy nil t)
  (elpy-enable))
(setq python-check-command "~/.emacs.d/languages/python/bin/flake8")
(setq elpy-rpc-python-command "python3")
; (elpy-use-ipython)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(setq-default python-indent 8)
(setq-default py-indent-offset 8)
(setq flycheck-python-pycompile-executable "python3")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        各窗口间切换(ecb-mode)                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm模式
(add-to-list 'load-path "~/.emacs.d/packages/emacs-async")
(add-to-list 'load-path "~/.emacs.d/packages/helm")
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        各窗口间切换(ecb-mode)                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ecb模式
(load-file "~/.emacs.d/packages/cedet/cedet.el")
(require 'cedet)
(add-to-list 'load-path "~/.emacs.d/packages/ecb")

(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-auto-activate t ecb-tip-of-the-day nil)
;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;				  global-semanticdb-minor-mode
;;				  global-semantic-idle-summary-mode
;;				  global-semantic-mru-bookmark-mode))
(global-set-key [f12] 'ecb-activate)
(global-set-key [C-f12] 'ecb-deactivate)
;; (semantic-mode t)
					; ;; ecb 窗口尺寸
(setq   ecb-tip-of-the-day nil
	ecb-tree-indent 5
	ecb-windows-height 0.5
	ecb-windows-width 0.20
	ecb-auto-compatibility-check nil
	ecb-version-check nil)
; 配置Semantic的检索范围:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (add-to-list 'load-path "~/.emacs.d/packages/window-number")
 (require 'window-number)
 (global-set-key (kbd "C-x o") 'window-number-switch)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (add-to-list 'load-path "~/.emacs.d/packages/vcl-mode")
 (require 'vcl-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
(ido-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(load-file "~/.emacs.d/packages/whole-line-or-region/whole-line-or-region.el")
(whole-line-or-region-mode)

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;                           设置GCC编译步骤                                  ;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (defun quick-compile ()
  "A quick compile funciton for C"
  (interactive)
  (compile (concat "gcc " (buffer-name (current-buffer)) " -Wall -std=c99 -g -Wstrict-prototypes")))
 (global-set-key (kbd "C-c 1") 'quick-compile)
 (defun quick-make ()
  (interactive)
  (compile (concat "make")))
 (global-set-key (kbd "C-c 2") 'quick-make)

 ; 代码折叠
 (add-hook 'c-mode-hook 'hs-minor-mode)
;
;
  (global-set-key (kbd "C-c =") 'hs-show-all)
  (global-set-key (kbd "C-c -") 'hs-hide-all)
  (global-set-key (kbd "C-c c =") 'hs-show-block)
  (global-set-key (kbd "C-c c -") 'hs-hide-block)
  (global-set-key (kbd "C-c [") 'comment-region)
 (global-set-key (kbd "C-c ]") 'uncomment-region)
;
 (setq c-default-style
       '((c-mode . "k&r") (other . "gnu")))


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;                           设置GDB                                          ;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; http://www.inet.net.nz/~nickrob/multi-gdb-ui.el
 ; http://www.inet.net.nz/~nickrob/multi-gud.el
 (add-to-list 'load-path "~/.emacs.d/packages/gdb")
 (setq gdb-many-windows t)
 (load-library "multi-gud.el")
 (load-library "multi-gdb-ui.el")
 (global-set-key [f11] 'gdb)

; ==============================================================
; =                     autopep8
; =============================================================
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

; ==============================================================
; =                     company-quickhelp
; =============================================================
(company-quickhelp-mode 1)

; ==============================================================
; =                     company-mode
; =============================================================
(add-hook 'shell-mode-hook company-mode)
(add-hook 'c-mode-hook company-mode)
(global-set-key [C-tab] 'elpy-company-backend)
