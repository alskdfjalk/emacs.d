; ===================================
;                    pyim
; ===================================
(require 'chinese-pyim)
(require 'chinese-pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
(chinese-pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
(setq default-input-method "chinese-pyim")


  (setq-default pyim-punctuation-half-width-functions
		'(pyim-probe-punctuation-line-beginning
		  pyim-probe-punctuation-after-punctuation))

  ;; 开启拼音搜索功能
  (setq pyim-isearch-enable-pinyin-search t)

  ;; 使用 pupup-el 来绘制选词框
  (setq pyim-page-tooltip 'popup)

  ;; 选词框显示5个候选词
  (setq pyim-page-length 5)

  ;; 让 Emacs 启动时自动加载 pyim 词库
  (add-hook 'emacs-startup-hook
	    #'(lambda () (pyim-restart-1 t)))
