;; Python Mode
(setq py-install-directory "~/.emacs.d/site-lisp/python-mode.el-6.1.2")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)
(require 'pylint)

;; Configure Python-Jedi 
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t) ;; optional
(setq jedi:complete-on-dot t) ;; optional

;; IPython 
(require 'ein)  ;; ipython notebook
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)

(provide 'setup-python)
