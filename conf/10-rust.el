;;; rust-mode
(require 'rust-mode)
;; cargo
;(add-hook 'rust-mode-hook 'cargo-minor-mode)
;; indentation
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
;; Formatting
(setq rust-format-on-save t)

;;; flycheck-rust
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;;; LSP
;; rust-analyzer
(add-to-list 'exec-path (expand-file-name "~/.local/bin/rust-analyzer"))
(setq-default rustic-format-trigger 'on-save)
(setq rustic-lsp-server 'rust-analyzer)
;; Clippy
(push 'rustic-clippy flycheck-checkers)
