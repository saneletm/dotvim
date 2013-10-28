;; === Automatically load abbreviations table ====
;;  Note that emacs chooses, by default, the filename
;; "~.abbrev_devs", so don't try to be too clever
;; by changing its name

(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)

;; ==== Set the highlight current line minor mode =====
;; Inevery buffer, the line which contains the cursor 
;; will be full hightlighted
;; (global-hl-line-mode 1)

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

;; ==== Enable auto complete ===
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

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

;; sweithch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)

;; nxhtml
;;(add-to-list 'load-path "~/.emacs.d/nxhtml/")
;;(load "~/.emacs.d/nxhtml/autostart.el")

;; Enable deft used for note taking, quickly locating/seaching/creating text files"
(require 'deft)
(global-set-key [f8] 'deft)
(set deft-use-filename-as-title t)

