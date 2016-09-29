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
    href=\"/css/htmlize.css\"/>\n
<link rel=\"stylesheet\" type=\"text/css\"
    href=\"/css/bigblow.css\"/>\n
<link rel=\"stylesheet\" type=\"text/css\"
    href=\"/css/hideshow.css\"/>\n

<script type=\"text/javascript\"
    src=\"/js/jquery-1.11.0.min.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/js/jquery-ui-1.10.2.min.js\"></script>\n

<script type=\"text/javascript\"
    src=\"/js/jquery.localscroll-min.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/js/jquery.scrollTo-1.4.3.1-min.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/js/jquery.zclip.min.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/js/bigblow.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/js/hideshow.js\"></script>\n
<script type=\"text/javascript\"
    src=\"/js/jquery.stickytableheaders.min.js\"></script>\n"
      )

(setq org-publish-project-alist
      '(

  ("org-blog"
	  ;; Path to your org files.
	  :base-directory "~/workspace/cj4777.github.io/org/"
	  :base-extension "org"

	  ;; Path to your Jekyll project.
	  :publishing-directory "~/workspace/jekyll/_post/"
	  :publishing-function org-html-export-to-html
	  :recursive t
	  :headline-levels 4
	  :html-extension "html"
	  :body-only t ;; Only export section between <body> </body>
    )

    ("blog" :components ("org-blog"))

))
