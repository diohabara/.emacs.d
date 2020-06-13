;;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'spacemacs-dark t)

;;; Highlight
(global-hl-line-mode 1)
(show-paren-mode 1)

;;; line & column number
(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)

;;; title bar
(setq frame-title-format "%f")

;;; show full path to file
(setq-default frame-title-format "%b (%f)")
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;;; show space characters
(setq-default show-trailing-whitespace t)
(set-face-background `trailing-whitespace "#b14770")
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;;; show current directory
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
          (cdr ls))))
