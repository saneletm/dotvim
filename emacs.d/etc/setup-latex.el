;;reftex
(require 'reftex)  ;; useful for formal paper writing

;;Add support for auctex
(add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'reftex-mode-hook 'imenu-add-menubar-index)
(global-set-key [down-mouse-3] 'imenu)

;;Latex Rubber
(eval-after-load "tex"
  '(progn
     (add-to-list 'TeX-expand-list
                  '("%(RubberPDF)"
                    (lambda ()
                      (if
                          (not TeX-PDF-mode)
                          ""
                        "--pdf"))))
     (add-to-list 'TeX-command-list
                '("Rubber" "rubber %(RubberPDF) %t" TeX-run-shell nil t) t)))

;; Rubber short cuts F9, and F12
(add-hook 'TeX-mode-hook
          '(lambda ()
            (define-key TeX-mode-map (kbd "<f9>") ;; compile pdf
              (lambda ()
                (interactive)
                (save-buffer)
                (TeX-command-menu "Rubber")
                (TeX-clean)))
            (define-key TeX-mode-map (kbd "<f7>") ;; view pdf
              (lambda ()
                (interactive)
                (TeX-view)
                [return]))))

(provide 'setup-latex)
