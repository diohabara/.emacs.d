(require 'cc-mode)
(require 'auto-complete-c-headers)
(require 'google-c-style)
(add-hook 'c++-mode-hook
          '(setq ac-sources
                 (append ac-sources
                         '(ac-source-c-headers))))
(add-hook 'c-mode-hook
          '(setq ac-sources
                 (append ac-sources
                         '(ac-source-c-headers))))
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (c-toggle-auto-hungry-state 1)
            (define-key c-mode-base-map "\C-m" 'newline-and-indent)
            ))

;; Google C++ Style Guide
(add-hook 'c-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)

;; ccls
(use-package ccls
  :custom
  (ccls-executable "/usr/local/bin/ccls")
  (ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight)
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))

;; (require 'auto-complete-clang-async)
;; (defun ac-cc-mode-setup ()
;;  (setq ac-clang-complete-executable "~/.emacs.d/el-get/repo/clang-complete-async/clang-complete")
;;  (setq ac-sources (append ac-sources '(ac-source-clang-async)))
;;  (ac-clang-launch-completion-process))
;; (defun my-ac-config ()
;;   (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))
;;   (my-ac-config)
