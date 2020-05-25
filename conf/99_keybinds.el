;;; delete
(define-key global-map (kbd "C-h") 'delete-backward-char)

;;; undo & redo
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z")   'undo-fu-only-undo)
(global-set-key (kbd "C-r") 'undo-fu-only-redo)

;;; stop unintentionally quitting Emacs
;; (global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-x C-z"))
(defalias 'exit 'save-buffers-kill-emacs)
;; set some command instead
;; (global-set-key (kbd "C-x C-c") 'eshell)
;; (global-set-key (kbd "C-x C-z") 'some-command)

;;; shell
(global-set-key (kbd "C-x C-c") 'ansi-term)
;; eshell keybinds
(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "C-p") 'eshell-previous-input)
            (define-key eshell-mode-map (kbd "C-n") 'eshell-next-input)
            ))

;;; rust
(define-key rust-mode-map (kbd "C-c C-r") 'rust-run)
(define-key rust-mode-map (kbd "C-c C-t") 'rust-test)

;;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;;; org-capture
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c C-j") 'org-journal-new-entry)
