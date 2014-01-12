(require 'flycheck)
(flycheck-define-checker javascript-jslint-reporter
  "A JavaScript syntax and style checker based on JSLint Reporter.

See URL `https://github.com/FND/jslint-reporter'."
  :command ("~/.emacs.d/site-lisp/jslint-reporter/jslint-reporter" source)
  :error-patterns
  ((error line-start (1+ nonl) ":" line ":" column ":" (message) line-end))
  :modes (js-mode js2-mode js3-mode))
(add-hook 'js-mode-hook (lambda ()
                          (flycheck-select-checker 'javascript-jslint-reporter)
                          (flycheck-mode)))

(provide 'setup-js)
