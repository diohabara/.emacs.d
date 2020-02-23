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
