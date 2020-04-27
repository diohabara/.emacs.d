;;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'spacemacs-dark)
(require 'spacemacs-common)
(deftheme spacemacs-dark "Spacemacs theme, the dark versioin")
(create-spacemacs-theme 'dark 'spacemacs-dark)
(provide-theme 'spacemacs-dark)

;;; Highlight
(global-hl-line-mode 1)
(show-paren-mode 1)

;;; line & column number
(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)

;;; title bar
(setq frame-title-format "%f")

;;; show space characters
(setq-default show-trailing-whitespace t)
(set-face-background `trailing-whitespace "#b14770")
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
