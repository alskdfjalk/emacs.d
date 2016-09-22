 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;                           Org-mode
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "PRESENT(p)" "|" "DONE(d)")
	      (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))
;; 禁用下划转义
(setq-default org-use-sub-superscripts nil)

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
	      ("PRESENT" :foreground "")
	      ("DONE" :foreground "forest green" :weight bold)
	      ("WAITING" :foreground "orange" :weight bold)
	      ("HOLD" :foreground "magenta" :weight bold)
	      ("CANCELLED" :foreground "forest green" :weight bold)
	      ;; ("MEETING" :foreground "forest green" :weight bold)
	      ;; ("PHONE" :foreground "forest green" :weight bold)
	      )
	     )
      )
(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\"
    href=\"/home/cj/.emacs.d/org/css/htmlize.css\"/>\n
<link rel=\"stylesheet\" type=\"text/css\"
    href=\"/home/cj/.emacs.d/org/css/bigblow.css\"/>\n
<link rel=\"stylesheet\" type=\"text/css\"
    href=\"/home/cj/.emacs.d/org/css/hideshow.css\"/>\n

<script type=\"text/javascript\"
    src=\"/home/cj/.emacs.d/org/js/jquery-1.11.0.min.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/home/cj/.emacs.d/org/js/jquery-ui-1.10.2.min.js\"></script>\n

<script type=\"text/javascript\"
    src=\"/home/cj/.emacs.d/org/js/jquery.localscroll-min.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/home/cj/.emacs.d/org/js/jquery.scrollTo-1.4.3.1-min.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/home/cj/.emacs.d/org/js/jquery.zclip.min.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/home/cj/.emacs.d/org/js/bigblow.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/home/cj/.emacs.d/org/js/hideshow.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/home/cj/.emacs.d/org/js/jquery.stickytableheaders.min.js\"></script>\n"
      )
