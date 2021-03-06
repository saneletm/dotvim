;; Enable evil, vim editor emulator 
(add-to-list 'load-path "~/.emacs.d/site-lisp/evil")
(require 'evil)
(evil-mode 1)

;; configure auto load of evil-paredit XXXFix
(require 'evil-paredit)

;;Evil Surround
(add-to-list 'load-path "~/.emacs.d/site-lisp/evil-surround/")
(require 'surround)
(global-surround-mode 1)

;;Evil numbers
(add-to-list 'load-path "~/.emacs.d/site-lisp/evil-numbers/")
(require 'evil-numbers)
(global-set-key (kbd "C-c =") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;;Evil matchit
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;;Evil with nerd-commenter
(setq evilnc-hotkey-comment-operator ",,")
(evilnc-default-hotkeys)

(provide 'setup-evil)
