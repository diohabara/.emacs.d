;; General
;;; Files
(setq delete-quto-save-files t) ;; delete auto-save files
(setq make-backup-files nil) ;; don't make backup files

;;; Sound
(setq ring-bell-function 'ignore) ;; stop beeping

;;; Key-config
(define-key global-map (kbd "C-z") 'undo)

;;; Indent
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;;; Highlight
(global-hl-line-mode t)
