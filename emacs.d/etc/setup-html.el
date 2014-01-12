;;HTML- Set indentation level to 2
    (add-hook 'html-mode-hook
        (lambda ()
          ;; Default indentation is usually 2 spaces, changing to 4.
          (set (make-local-variable 'sgml-basic-offset) 2)))

;;HTML- Turn xnml-mode for html files
(add-hook 'html-mode-hook 'xnml-mode)

;;HTML- Turn auto complete-mode in htm mode
(add-hook 'html-mode-hook 'auto-complete-mode)

(provide 'setup-html)
