;; General
;;; Stop default things
(setq delete-quto-save-files t)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(menu-bar-mode -1)

;;; Key-config
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-h") 'deleta-backward-char)

;;; Indent
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;;; Highlight
(global-hl-line-mode t)
(show-paren-mode 1)
;;;; line & column number
(line-number-mode t)
(column-number-mode t)

;;; Language
(prefer-coding-system 'utf-8)
