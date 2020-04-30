;;; delete
(define-key global-map (kbd "C-h") 'delete-backward-char)

;;; undo & redo
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z")   'undo-fu-only-undo)
(global-set-key (kbd "C-r") 'undo-fu-only-redo)

;;; quit Emacs
(global-unset-key (kbd "C-x C-c"))
(defalias 'exit 'save-buffers-kill-emacs)
;; set some command instead
;; (global-set-key (kbd "C-x C-c") 'some-command)

