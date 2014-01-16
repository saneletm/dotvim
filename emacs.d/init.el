;; (setq-default abbrev-mode t)
;; (read-abbrev-file "~/.emacs.d/abbrev_defs")
;; (setq save-abbrevs t)

;; Set the highlight current line minor mode 
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/etc/")

;; activate meta key for mac
(set-keyboard-coding-system nil)

;; No spalsh screen please ... jeez
;; (setq inhibit-startup-message t)

;; In every buffer, the line which contains the cursor 
;; will be full hightlighted
;; (global-hl-line-mode 1)

;; Package Management
;; Configure Marmalade
(require 'package)

;; ELPA 
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; Setup package XXXFix
(add-to-list 'load-path "~/.emacs.d/etc/")
(require 'setup-package)

;; Install packages that need installation
(defun init--install-packages ()
  (packages-install
   '(magit
     paredit
     evil-matchit
     evil-nerd-commenter
     evil-visualstar
     evil-paredit
     jedi
     yasnippet
     pandoc-mode
     flycheck
     pylint
     ein
     git-gutter
     auctex ;; latex menu for file inputs
     projectile ;; project interaction library
     flx-ido ;; fixes ido for projectile
     )))

(condition-case nill
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Disable both tool-bar and menu-bar modes
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Enable Line and Column Numbering 
;; show line -number in the mode line
(line-number-mode 1)

;; Set the  fill column
;; enable backup files .
(setq-default fill-column 72)

;; Display Line numbers 
(require 'linum)
(global-linum-mode t)  
(setq linum-format "%3d ") 

;; SCROLL one line at a time when you move cursor past top/btm of window
(setq scroll-conservatively 10000)

;; Enable current parenthesis matching, when cursor is on pair
(show-paren-mode 1)

;; Flycheck
(require 'flycheck)

;; Evil
(require 'setup-evil)

;; Activate magit
(require 'magit)

;; Activate IDO Mode
(require 'ido)
(setq ido-enable-flex-matching t)
(setq id-everywhere t)
(ido-mode t)

;; Enable auto complete 
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(setq ac-auto-start t)
(ac-config-default)
(setq ac-disable-faces nil)

;; Paredit
;; lisp code
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; Autopairs
(require 'setup-autopairs)

;; emacs Git Gutter to show git diff (use fringe)
(global-git-gutter-mode +1)
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/git-gutter-fringe/")
;; (require 'git-gutter-fringe) 
(require 'fringe-helper)

;; Activate yasnippet
(add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet/")
(require 'yasnippet)
(yas-global-mode 1)
;; (require yasnippet-bundle)

;; Python
(require 'setup-python)

;; HTML
(require 'setup-html)

;; JavaScript Flycheck with JSLint
(require 'setup-js)

;;Less-CSS
(eval-after-load "less-css" (require 'setup-less-css)) 

;; LATEX
(require 'setup-latex)

;; Use emacs to refresh your browser
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/xrefresh-emacs/")
;; (require 'xrefresh)(xrefresh-start)

;; Projectile
;; Projectile with flx-ido can waste a lot of memory
;; see setupfile, and documentation
;; (eval-after-load "projectile" (require 'setup-projectile)) 
(require 'setup-projectile) ;; Temp sln... need eval-after-load

;; Enable deft used for note taking, quickly locating/seaching/creating text files"
(require 'deft)
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directory "~/Dropbox/Sanele/Org-mode")
(global-set-key [f8] 'deft)
(setq deft-use-filename-as-title t)

;; Activate and config org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;; Optimize indentation for outline-stlye documents
(setq org-startup-indented t)
(setq org-log-done t)
;; Auto hide leading stars
(setq org-hide-leading-stars t)

;; Pandoc is a haskell implemented markup converter. usefull in resume writting.
(load "pandoc-mode") ;; add to tex-mode-hook

;; sr-speedbar
(require 'sr-speedbar)
