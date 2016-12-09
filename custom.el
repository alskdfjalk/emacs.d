; ===================================
; =                     global
; ===================================
(yas-global-mode)
(company-mode)
(toggle-truncate-lines -1)
(setq default-line-spacing 0)
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
;;行号格式
(setq linum-format "%4d ")
(global-linum-mode t)
;; 默认浏览器
(setq browse-url-browser-function 'google-chrome-stable)
(setq scroll-margin 5 scroll-conservatively 10000) ;; 平滑翻页
;; term 粘贴
; (add-hook 'term-mode-hook (lambda () (define-key term-raw-map (kbd "C-y") 'term-paste)))
;; 主题
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/monokai")
(load-theme 'monokai t)
;; 全局缩进
(setq-default tabs-width 8)
(setq-default indent-tabs-mode t)
(setq sh-basic-offset 8)

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
	     '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives
	       '("gnu" . "http://elpa.gnu.org/packages/")
	       ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        auto-complete                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'undo-tree)
(global-undo-tree-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        auto-complete                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)

; ==============================================================
; =                     conf-mode
; =============================================================
(defun my-own-conf-mode ()
  (auto-complete-mode t)
  (global-set-key [C-tab] 'auto-complete)
  )
(add-hook 'conf-mode-hook 'my-own-conf-mode)

; ==============================================================
; =                     anaconda
; =============================================================
(require 'sphinx-doc)

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

; ===========================================================
; =                     autopair
; ===========================================================
(add-to-list 'load-path "~/.emacs.d/packages/autopair")
(require 'autopair)
(autopair-global-mode)
(add-hook 'js-mode-hook '(lambda () (autopair-mode)))
(add-hook 'html-mode-hook '(lambda () (autopair-mode)))
; (add-hook 'python-mode-hook '(lambda () (autopair-mode)))

; ===========================================================
; =                     shell
; ===========================================================
(add-hook 'sh-mode-hook '(lambda ()
			   (autopair-mode)
			   (hs-minor-mode)
			   )
	  )

; ============================================================
; =                     python-mode
; ============================================================
(defun my-own-python ()
  (local-set-key (kbd "M-.") 'elpy-goto-definition)
  (local-set-key (kbd "M-,") 'pop-tag-mark)
  (py-autopep8-enable-on-save)
  (auto-complete-mode -1)
  (autopair-mode t)
  (anaconda-mode t)
  (anaconda-eldoc-mode t)
  (elpy-mode t)
  (hs-minor-mode t)
  (sphinx-doc-mode t)
  (whitespace-mode t)
  (yas-global-mode t)
  )
(require 'py-autopep8)
(add-hook 'python-mode-hook 'my-own-python)

(setenv "WORKON_HOME"
	(concat
	 "~/.local/python3")
	)
(setenv "PYTHONPATH" "~/.local/")
(defadvice virtualenv-activate (after virtual-pdb)
  (custom-set-variables
     '(gud-pdb-command-name
       (concat virtualenv-active "/usr/bin/pdb" ))))
(ad-activate 'virtualenv-activate)
(pyvenv-activate "~/.local")
(when (require 'elpy nil t)
  (elpy-enable))
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-backend "jedi")
(setq elpy-interactive-python-command "~/.local/bin/ipython")
(setq python-check-command "~/.local/bin/flake8")
; (elpy-use-ipython)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(setq-default python-indent 8)
(setq-default py-indent-offset 8)
(setq flycheck-python-pycompile-executable "python3")
;; (setq
;;  python-shell-interpreter "python3"
;;  python-shell-interpreter-args "--profile=dev"
;; )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        各窗口间切换(ecb-mode)                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm模式
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        使用 xdg-open 打开文件             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun prelude-open-with (arg)
  "Open visited file in default external program.
With a prefix ARG always prompt for command to use."
  (interactive "P")
  (when buffer-file-name
    (shell-command (concat
		    (cond
		     ((and (not arg) (eq system-type 'darwin)) "open")
		     ((and (not arg) (member system-type
					     '(gnu gnu/linux gnu/kfreebsd)))
		      "exo-open")
		     (t (read-shell-command "Open current file with: ")))
		    " "
		    (shell-quote-argument buffer-file-name)))))
;; 默认用 google-chrome 作浏览器
(setq browse-url-generic-program "google-chrome")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; (add-to-list 'load-path "~/.emacs.d/packages/window-number")
 ;; (require 'window-number)
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
; (setq aw-background nil)


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
 (defun quick-clean ()
  "A quick compile funciton for C"
  (interactive)
  (compile (concat "make clean ")))
 (global-set-key (kbd "C-c 3") 'quick-clean)

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;                           设置GDB                                          ;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; http://www.inet.net.nz/~nickrob/multi-gdb-ui.el
 ; http://www.inet.net.nz/~nickrob/multi-gud.el
 (add-to-list 'load-path "~/.emacs.d/packages/gdb")
 (load-library "multi-gud.el")
 (load-library "multi-gdb-ui.el")
 (global-set-key [f11] 'gdb)
 (setq gdb-many-windows t)
 (setq gdb-show-main t)

; ===================================
; =                     minimap-mode
; ===================================
(minimap-mode t)
(setq minimap-window-location 'right)

; ===================================
;                    company-quickhelp
; ===================================
(company-quickhelp-mode 1)

; ===================================
; =                     company-mode
; ===================================
(global-set-key [C-tab] 'elpy-company-backend)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        各窗口间切换(ecb-mode)              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ecb模式
(load-file "~/.emacs.d/packages/cedet/cedet.el")
(require 'cedet)
(add-to-list 'load-path "~/.emacs.d/packages/ecb")
(require 'ecb)
(setq stack-trace-on-error nil) ;;don’t popup Backtrace window
(setq ecb-tip-of-the-day nil)
(setq ecb-auto-activate t)
(setq ecb-layout-name "leftright2")
(setq ecb-options-version "2.40")
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1–mouse-2))
(setq ecb-source-path (quote ("~/workspace")))
(setq auto-update-methods-after-save t)
(setq auto-expand-token-tree t)
(setq ecb-expand-methods-nodes t)
(setq ecb-methods-nodes-expand-spec t)
(setq bucket-token-display t)
(global-set-key [f12] 'ecb-activate)
(global-set-key [C-f12] 'ecb-deactivate)
;; ecb 窗口尺寸
(setq ecb-tip-of-the-day nil
	ecb-tree-indent 3
	; ecb-windows-height 0.8
	ecb-windows-width 0.20
	ecb-auto-compatibility-check nil
	ecb-version-check nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (evil-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        C-IDE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/packages/cc-mode-5.33")
(add-to-list 'load-path "~/.emacs.d/packages/helm-gtags")
(require 'helm-gtags)
(setq-default c-set-style "cc-mode"
	      c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t)
(defun artm-guess-c-style ()
  (let ((style
	 (assoc-default buffer-file-name artm-c-styles-alist
			(lambda (pattern path)
			  (or (not pattern)
			      (and (stringp path)
				   (string-match pattern path))))
			;; factory default (in case you forget
			;; to add (nil . "some style") to
			;; artm-c-styles-alist
			'(nil . "linux"))))
    (cond
     ((stringp style) (c-set-style style))
     ((functionp style) (style)))))
(defun call-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include")
  (add-to-list 'company-backends 'company-c-headers)
  )
;; (defun my:add-semantic-to-autocomplete()
;;   (semantic-mode t)
;;   (global-ede-mode t)
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;;   )
(add-hook 'c-mode-hook '(lambda ()
			  (helm-gtags-mode)
			  (hs-minor-mode)
			  (autopair-mode)
			  (auto-complete-mode)
			  (call-c-header-init)
			  (yas-global-mode)
			  )
	  )

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
     (define-key helm-gtags-mode-map (kbd "C-.") 'helm-gtags-dwim)
     (define-key helm-gtags-mode-map (kbd "C-,") 'helm-gtags-pop-stack)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)))
