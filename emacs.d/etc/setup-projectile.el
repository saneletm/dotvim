;; Projectile Setup file

(projectile-global-mode)

;; setup ido to work efficiently as its now used by projectile
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(provide 'setup-projectile)
