;;; Rust Analyzer
(add-to-list 'exec-path (expand-file-name "~/.local/bin/rust-analyzer"))
(setq-default rustic-format-trigger 'on-save)
(setq rustic-lsp-server 'rust-analyzer)
