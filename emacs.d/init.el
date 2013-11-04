;; === Automatically load abbreviations table ====
;;  Note that emacs chooses, by default, the filename
;; "~.abbrev_devs", so don't try to be too clever
;; by changing its name

;;(setq-default abbrev-mode t)
;;(read-abbrev-file "~/.emacs.d/abbrev_defs")
;;(setq save-abbrevs t)

;; ==== Set the highlight current line minor mode =====
(add-to-list 'load-path "~/.emacs.d/")
;; Inevery buffer, the line which contains the cursor 
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


;; ==== Enable LIne and Column Numbering ====
;; show line -number in the mode line
(line-number-mode 1)

;; ==== Set the  fill column ====
;; enable backup files .
(setq-default fill-column 72)

;; ==== Display Line numbers ====
(require 'linum)
(global-linum-mode 1)  

(setq linum-format "%3d ") 

;; ==== Activate magit ====
(require 'magit)

;; ==== Enable evil, vim editor emulator ====
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;;Evil Surround
(add-to-list 'load-path "~/.emacs.d/evil-surround/")
(require 'surround)
(global-surround-mode 1)

;;Evil numbers
(add-to-list 'load-path "~/.emacs.d/evil-numbers/")
(require 'evil-numbers)
(global-set-key (kbd "C-c =") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;;Evil matchit
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;;Evil with nerd-commenter
(setq evilnc-hotkey-comment-operator ",,")

;; ==== Enable auto complete ===
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(setq ac-auto-start t)
(ac-config-default)
(setq ac-disable-faces nil)

;; ===== Enable predictive===
;;(add-to-list 'load-path "~/.emacs.d/predictive")
;;(require 'predictive)

;; ==== Python Mode =====
(setq py-install-directory "~/.emacs.d/pyton-mode.el-6.1.2")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

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

(require 'flymake)
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Enable epylint checking 
(when (load "flymake" t)
      (defun flymake-pylint-init ()
        (let* ((temp-file (flymake-init-create-temp-buffer-copy
                           'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
          (list "epylint" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))

;; code checking via flymake
;; set code checker here from "epylint", "pyflakes"
;;(setq pycodechecker "pyflakes")
;;(when (load "flymake" t)
;;  (defun flymake-pycodecheck-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;      (list pycodechecker (list local-file))))
;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pycodecheck-init)))


;; SCROLL one line at a time when you move cursor past top/btm of window
(setq scroll-conservatively 10000)

;;Activate IDO Mode
(require 'ido)
(setq ido-enable-flex-matching t)
(setq id-everywhere t)
(ido-mode t)

