;;; package
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;;; custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (google-c-style git-gutter git-gutter+ git-gutter-fringe undo-fu rustic rust-mode nasm-mode prettier-js company-tern xref-js2 js2-refactor js2-mode tide web-mode auto-complete-clang-async auto-complete-c-headers elpy zenburn-theme spacemacs-theme lsp-ui lsp-treemacs dap-mode posframe company-lsp yasnippet lsp-mode sbt-mode lsp-scala scala-mode cl-lib-highlight exec-path-from-shell tuareg wakatime-mode git-gutter-fringe+ flycheck neotree company avy-migemo swiper counsel ivy magit use-package init-loader ggtags auto-save-buffers-enhanced)))
 '(web-mode-enable-auto-quoting nil)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
