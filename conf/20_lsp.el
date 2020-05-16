(use-package lsp-mode
  :commands lsp
  :custom
  ((lsp-enable-snippet t)
   (lsp-enable-indentation nil)
   (lsp-prefer-flymake nil)
   (lsp-document-sync-method 'incremental)
   (lsp-inhibit-message t)
   (lsp-message-project-root-warning t)
   (create-lockfiles nil))
  :init
  (unbind-key "C-l")
  :bind
  (("C-l C-l"  . lsp)
   ("C-l h"    . lsp-describe-session)
   ("C-l t"    . lsp-goto-type-definition)
   ("C-l r"    . lsp-rename)
   ("C-l <f5>" . lsp-restart-workspace)
   ("C-l l"    . lsp-lens-mode))
  :hook
  (prog-major-mode . lsp-prog-major-mode-enable))

(use-package lsp-ui
  :commands lsp-ui-mode
  :after lsp-mode
  :custom
  ;; lsp-ui-doc
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-max-width  60)
  (lsp-ui-doc-max-height 20)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit nil)

  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable t)

  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-symbol t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-code-actions t)

  ;; lsp-ui-imenu
  (lsp-ui-imenu-enable nil)
  (lsp-ui-imenu-kind-position 'top)

  ;; lsp-ui-peek
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-always-show t)
  (lsp-ui-peek-peek-height 30)
  (lsp-ui-peek-list-width 30)
  (lsp-ui-peek-fontify 'always)
  :hook
  (lsp-mode . lsp-ui-mode)
  :bind
  (("C-l s"   . lsp-ui-sideline-mode)
   ("C-l C-d" . lsp-ui-peek-find-definitions)
   ("C-l C-r" . lsp-ui-peek-find-references)))
