;;(setq-default abbrev-mode t)
;;(read-abbrev-file "~/.emacs.d/abbrev_defs")
;;(setq save-abbrevs t)

;; ==== Set the highlight current line minor mode =====
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; activate meta key for mac
(set-keyboard-coding-system nil)

;;No spalsh screen please ... jeez
;;(setq inhibit-startup-message t)

;; In every buffer, the line which contains the cursor 
;; will be full hightlighted
;; (global-hl-line-mode 1)

;;Package Management
;;Configure Marmalade
(require 'package)

;;ELPA 
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;;Setup package XXXFix
(add-to-list 'load-path "~/.emacs.d/etc/")
(require 'setup-package)

;;Install packages that need installation
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
     )))

(condition-case nill
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; configure auto load of evil-paredit XXXFix
(require 'evil-paredit)

;; ==== Enable Line and Column Numbering ====
;; show line -number in the mode line
(line-number-mode 1)

;; ==== Set the  fill column ====
;; enable backup files .
(setq-default fill-column 72)

;; ==== Display Line numbers ====
(require 'linum)
(global-linum-mode t)  

(setq linum-format "%3d ") 

;;(add-to-list 'load-path "~/.emacs.d/etc/")
(eval-after-load 'evil '(require 'setup-evil))

;; ==== Enable evil, vim editor emulator ====
(add-to-list 'load-path "~/.emacs.d/site-lisp/evil")
(require 'evil)
(evil-mode 1)

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

;; ====Activate magit====
(require 'magit)

;; ==== Enable auto complete ===
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(setq ac-auto-start t)
(ac-config-default)
(setq ac-disable-faces nil)

;; ===== Enable predictive===
;;(add-to-list 'load-path "~/.emacs.d/predictive")
;;(require 'predictive)

;; ==== Python Mode =====
(setq py-install-directory "~/.emacs.d/site-lisp/python-mode.el-6.1.2")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

;;Disable both tool-bar and menu-bar modes
(tool-bar-mode -1)
(menu-bar-mode -1)

;;IPython 
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)

;;HTML- Set indentation level to 2
    (add-hook 'html-mode-hook
        (lambda ()
          ;; Default indentation is usually 2 spaces, changing to 4.
          (set (make-local-variable 'sgml-basic-offset) 2)))

;;HTML- Turn xnml-mode for html files
(add-hook 'html-mode-hook 'xnml-mode)

;;HTML- Turn auto complete-mode in htm mode
(add-hook 'html-mode-hook 'auto-complete-mode)

;; NXHTML XXXFix BCKGRND
;;(add-to-list 'load-path "~/.emacs.d/nxhtml/")
;;(load "~/.emacs.d/nxhtml/autostart.el")

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

;; SCROLL one line at a time when you move cursor past top/btm of window
(setq scroll-conservatively 10000)

;;Activate IDO Mode
(require 'ido)
(setq ido-enable-flex-matching t)
(setq id-everywhere t)
(ido-mode t)

;;Activate yasnippet
(add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet/")
(require 'yasnippet)
(yas-global-mode 1)
;; (require yasnippet-bundle)

;; Configure Python-Jedi -- Auto Completion and python-code viewer
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)             ; optional

;; loading emacs-for-python
;
;;(load-file "~/.emacs.d/site-lisp/emacs-py/epy-init.el")

;; Use emacs to refresh ur browser
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/xrefresh-emacs/")
;;(require 'xrefresh)(xrefresh-start)

;; Pandoc is a haskell implemented markup converter. usefull in resume writting.
(load "pandoc-mode") ;; add to tex-mode-hook

;; Enable current parenthesis matching
(show-paren-mode 1)

(require 'flycheck)
(require 'pylint)

(require 'ein)  ;; ipython notebook


;; JavaScript Flycheck with JSLint
(require 'flycheck)
(flycheck-define-checker javascript-jslint-reporter
  "A JavaScript syntax and style checker based on JSLint Reporter.

See URL `https://github.com/FND/jslint-reporter'."
  :command ("~/.emacs.d/jslint-reporter/jslint-reporter" source)
  :error-patterns
  ((error line-start (1+ nonl) ":" line ":" column ":" (message) line-end))
  :modes (js-mode js2-mode js3-mode))
(add-hook 'js-mode-hook (lambda ()
                          (flycheck-select-checker 'javascript-jslint-reporter)
                          (flycheck-mode)))

;; emacs git gutter to show git diff (use fringe)
(global-git-gutter-mode +1)

;;LATEX
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
