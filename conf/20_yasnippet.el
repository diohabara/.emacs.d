(use-package yasnippet
  :bind
  (:map yas-minor-mode-map
        ("C-x i n" . yas-new-snippet)
        ("C-x i v" . yas-visit-snippet-file)
        ("C-M-i"   . yas-insert-snippet))
  (:map yas-keymap
        ("<tab>" . nil)) ;; because of avoiding conflict with company keymap
  :init
  (yas-global-mode t))
