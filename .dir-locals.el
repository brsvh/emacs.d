;;; Directory Local Variables            -*- no-byte-compile: t -*-
;;; For more information see (info "(emacs) Directory Variables")

((nil . ((eval . (display-fill-column-indicator-mode 1))))
 (auto-mode-alist . (("melpa/[^/]*$" . lisp-data-mode)))
 (lisp-data-mode . ((indent-tabs-mode . nil)
                    (sentence-end-double-space . t)))
 (org-mode . ((eval . (auto-fill-mode 1))
              (eval . (org-toggle-link-display))
              (fill-column . 72)
              (indent-tabs-mode . nil)
              (sentence-end-double-space . t))))
