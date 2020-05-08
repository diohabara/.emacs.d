(autoload `nasm-mode "~/.emacs.d/elpa/nasm-mode-20190410.342/nasm-mode.el" "" t)
(add-to-list `auto-mode-alist `("\\.\\(asm\\|s\\)$" . nasm-mode))

(add-hook 'asm-mode-hook
          (lambda ()
            (setq tab-width 4)))
