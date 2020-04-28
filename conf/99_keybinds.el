;;; delete
(define-key global-map (kbd "C-h") 'delete-backward-char)

;;; undo & redo
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z")   'undo-fu-only-undo)
(global-set-key (kbd "C-S-z") 'undo-fu-only-redo)
