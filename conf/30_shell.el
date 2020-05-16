;; start eshell
(global-set-key (kbd "C-x C-c") 'ansi-term)

;; eshell keybinds
(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "C-p") 'eshell-previous-input)
            (define-key eshell-mode-map (kbd "C-n") 'eshell-next-input)
            ))
