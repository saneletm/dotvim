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
(global-linum-mode 1)   ;; Make line-number mode default
(setq linum-format "%3d ")  ;; Add line between line numbers and buffer content

;; ==== Activate magit ====
(require 'magit)

;; ==== Enable evil, vim editor emulator ====
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
