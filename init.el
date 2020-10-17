;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Unset keys
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Packages
;;;;;;;;;;;;;;;;;;;;
;; package manager
(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;
;; use-package
(unless package-archive-contents
  (package-refresh-contents))
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;
;; init-loader
(use-package  init-loader
  :ensure)

;;;;;;;;;;;;;;;;;;;;
;; stop warning
(setq byte-compile-warnings '(not cl-functions obsolete))

;;;TODO: (init-loader-load "~/.emacs.d/conf")





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ccls-executable "/usr/local/bin/ccls")
 '(ccls-sem-highlight-method 'font-lock)
 '(ccls-use-default-rainbow-sem-highlight nil t)
 '(company-echo-delay 0 t)
 '(company-idle-delay 0)
 '(company-lsp-async t)
 '(company-lsp-cache-candidates nil)
 '(company-lsp-enable-recompletion t)
 '(company-lsp-enable-snippet t)
 '(company-minimum-prefix-length 2)
 '(company-selection-wrap-around t)
 '(company-transformers '(company-sort-by-backend-importance))
 '(completion-ignore-case t t)
 '(create-lockfiles nil)
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(lsp-document-sync-method 'incremental)
 '(lsp-enable-indentation nil)
 '(lsp-enable-snippet t)
 '(lsp-inhibit-message t t)
 '(lsp-message-project-root-warning t t)
 '(lsp-prefer-flymake nil t)
 '(lsp-ui-doc-enable t t)
 '(lsp-ui-doc-header t t)
 '(lsp-ui-doc-include-signature t t)
 '(lsp-ui-doc-max-height 20 t)
 '(lsp-ui-doc-max-width 60 t)
 '(lsp-ui-doc-position 'top t)
 '(lsp-ui-doc-use-childframe t t)
 '(lsp-ui-doc-use-webkit nil t)
 '(lsp-ui-flycheck-enable t t)
 '(lsp-ui-imenu-enable nil t)
 '(lsp-ui-imenu-kind-position 'top t)
 '(lsp-ui-peek-always-show t t)
 '(lsp-ui-peek-enable t t)
 '(lsp-ui-peek-fontify 'always t)
 '(lsp-ui-peek-list-width 30 t)
 '(lsp-ui-peek-peek-height 30 t)
 '(lsp-ui-sideline-enable t t)
 '(lsp-ui-sideline-ignore-duplicate t t)
 '(lsp-ui-sideline-show-code-actions t t)
 '(lsp-ui-sideline-show-diagnostics t t)
 '(lsp-ui-sideline-show-hover t t)
 '(lsp-ui-sideline-show-symbol t t)
 '(org-journal-date-format "%A, %d %B %Y" t)
 '(org-journal-dir "~/Dropbox/Org/journal" t)
 '(package-selected-packages
   '(slime doom-themes doom doom-modeline haskell-mode ob-rust ob-ipython material-theme dockerfile-mode docker protobuf-mode gocode rtags thingopt jedi-mode tuareg-mode revert-buffer multi-term bazel-mode rainbow-delimiters helm-config flycheck-pos-tip elscreen undohist undo-tree wgrep helm-c-moccur helm yaml-mode org-journal-list org-journal org-capture-pop-frame go-autocomplete go-eldoc go-mode xclip jedi flycheck-rust cargo py-autopep8 ccls google-c-style git-gutter git-gutter+ git-gutter-fringe undo-fu rustic rust-mode nasm-mode prettier-js company-tern xref-js2 js2-refactor js2-mode tide web-mode auto-complete-clang-async auto-complete-c-headers elpy zenburn-theme spacemacs-theme lsp-ui lsp-treemacs dap-mode posframe company-lsp yasnippet lsp-mode sbt-mode lsp-scala scala-mode cl-lib-highlight exec-path-from-shell tuareg wakatime-mode git-gutter-fringe+ flycheck neotree company avy-migemo swiper counsel ivy magit use-package init-loader ggtags auto-save-buffers-enhanced))
 '(web-mode-enable-auto-quoting nil)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
(put 'set-goal-column 'disabled nil)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Paths
;;;;;;;;;;;;;;;;;;;;
;; automatically read these directories
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; TODO:(add-to-load-path "elisp" "conf" "public_repos")





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Coding
;;;;;;;;;;;;;;;;;;;;
;; rtags
(use-package rtags
  :ensure t
  :hook ((c-mode . rtags-start-process-unless-running)
         (c++-mode . rtags-start-process-unless-running)
         )
  :config (setq rtags-completions-enabled t
		rtags-path "/home/manoj/.emacs.d/rtags/src/rtags.el"
		rtags-rc-binary-name "/home/manoj/.emacs.d/rtags/bin/rc"
		rtags-use-helm t
		rtags-rdm-binary-name "/home/manoj/.emacs.d/rtags/bin/rdm")
  :bind (("C-c E" . rtags-find-symbol)
  	 ("C-c e" . rtags-find-symbol-at-point)
  	 ("C-c O" . rtags-find-references)
  	 ("C-c o" . rtags-find-references-at-point)
  	 ("C-c s" . rtags-find-file)
  	 ("C-c v" . rtags-find-virtuals-at-point)
  	 ("C-c F" . rtags-fixit)
  	 ("C-c f" . rtags-location-stack-forward)
  	 ("C-c b" . rtags-location-stack-back)
  	 ("C-c n" . rtags-next-match)
  	 ("C-c p" . rtags-previous-match)
  	 ("C-c P" . rtags-preprocess-file)
  	 ("C-c R" . rtags-rename-symbol)
  	 ("C-c x" . rtags-show-rtags-buffer)
  	 ("C-c T" . rtags-print-symbol-info)
  	 ("C-c t" . rtags-symbol-type)
  	 ("C-c I" . rtags-include-file)
  	 ("C-c i" . rtags-get-include-file-for-symbol)))

;;;;;;;;;;;;;;;;;;;;
;; undohist
(use-package undohist
  :ensure t
  )
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  )

;;;;;;;;;;;;;;;;;;;;
;; Change default settings
(setq auto-save-default nil) ; stop making autosaving files
(setq delete-auto-save-files t) ; delete autosaving files
(setq make-backup-files nil) ; stop backing up
(setq ring-bell-function 'ignore) ; stop ringing
(setq inhibit-startup-message t) ; stop showing startup message
(menu-bar-mode nil)
(setq-default indent-tabs-mode nil) ; stop using tabs
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; delete whitespace
(fset 'yes-or-no-p 'y-or-n-p) ; ask "y or n" instead of "yes or no"

;;;;;;;;;;;;;;;;;;;;
;; copy clipboard
(cond (window-system
       (setq select-enable-clipboard t)))
(use-package xclip
  :ensure t
  :config
  (xclip-mode t)
  )
(global-auto-revert-mode t) ; reload changed files

;;;;;;;;;;;;;;;;;;;;
;; wgrep
(use-package wgrep
  :ensure t
  )

;;;;;;;;;;;;;;;;;;;;
;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(cua-selection-mode t)

;;;;;;;;;;;;;;;;;;;;
;; multiple-cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-S-d" . mc/mark-all-like-this))
  )

;;;;;;;;;;;;;;;;;;;;
;; docker
(use-package docker
  :ensure t
  :bind ("C-c d" . docker))
(use-package dockerfile-mode
  :ensure t
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Display
;;;;;;;;;;;;;;;;;;;;
;; Encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8)


;;;;;;;;;;;;;;;;;;;;
;; sidebar
(tool-bar-mode 0) ; hide toolbar
;(scroll-bar-mode 0) ; hide scrollbar
(toggle-truncate-lines 0) ; hide truncate line
(line-number-mode t) ; line number
(column-number-mode t) ; colunn number
(global-linum-mode t) ; show line numbers
(global-hl-line-mode t) ; highlight current line

;;;;;;;;;;;;;;;;;;;;
;; highlight current parantheses
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match nil
                    :background nil
                    :underline "darkgreen")

;;;;;;;;;;;;;;;;;;;;
;; show full path
;; (setq-default frame-title-format "%b (%f)")
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;;;;;;;;;;;;;;;;;;;;
;; show space characters
(setq-default show-trailing-whitespace t)
(set-face-background `trailing-whitespace "#b14770")
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;;;;;;;;;;;;;;;;;;;;
;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(use-package doom
  :ensure t)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; set background color
(set-face-background 'region "darkgreen")

;;;;;;;;;;;;;;;;;;;;
;; fonts
;; English
(set-face-attribute 'default nil
                    :family "JetBrains Mono"
                    :height 130
                    :weight 'normal
                    :width 'normal)
;; Japanese





;;;;;;;;;;;;;;;;;;;;
;; ELScreen
(use-package elscreen
  :ensure t
  :config
  (setq elscreen-prefix-key (kbd "C-t"))
  (elscreen-start)
  )




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Languages
;;;;;;;;;;;;;;;;;;;;
;; LSP
(use-package lsp-mode
  :ensure t
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
   ("C-l <f5>" . lsp-workspace-restart)
   ("C-l l"    . lsp-lens-mode))
  :hook
  (prog-major-mode . lsp-prog-major-mode-enable)
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  :config
  (setq lsp-diagnostic-package nil)
  )
(use-package lsp-ui
  :ensure t
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
   ("C-l C-r" . lsp-ui-peek-find-references))
  )

;;;;;;;;;;;;;;;;;;;;
;; elisp
(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (use-package eldoc
          :ensure t
          :config
          (setq eldoc-idle-delay 0.2)
          (setq eldoc-echo-area-use-multiline-p t))
    (turn-on-eldoc-mode)))
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)

;;;;;;;;;;;;;;;;;;;;
;; Assembly: https://www.emacswiki.org/emacs/AsmMode
(defun my-asm-mode-hook ()
  (local-unset-key (vector asm-comment-char))
  (setq tab-always-indent (default-value 'tab-always-indent)))
(add-hook 'asm-mode-hook #'my-asm-mode-hook)


;;;;;;;;;;;;;;;;;;;;
;; C/C++
(use-package cc-mode
  :ensure t
  )
(use-package auto-complete-c-headers
  :ensure t
  )
(use-package google-c-style
  :ensure t
  :hook
  (c-mode . #'google-set-c-style)
  (c++-mode . #'google-set-c-style)
  )
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
(use-package ccls
  :ensure t
  :custom
  (ccls-executable "/usr/local/bin/ccls")
  (ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight)
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp)))
  )

;;;;;;;;;;;;;;;;;;;;
;; Go
(use-package go-mode
  :ensure t
  )
(use-package go-eldoc
  :ensure t
  )
(use-package go-autocomplete
  :ensure t
  :bind (("M-." . godef-jump)
         ("M-," . pop-tag-mark))
  :config
  (add-to-list 'company-backends 'company-go) ; company-go
  (add-hook 'go-mode-hook 'go-eldoc-setup) ; eldoc
  )

;;;;;;;;;;;;;;;;;;;;
;; OCaml
(use-package tuareg
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
  (autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
  (autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
  (autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)
  )

;;;;;;;;;;;;;;;;;;;;
;; Haskell
(use-package haskell-mode
  :ensure t)

;;;;;;;;;;;;;;;;;;;;
;; Python
(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  )
(use-package jedi
  :ensure t
  :hook
  ('python-mode-hook #'jedi:setup)
  :config
  (setq jedi:complete-on-dot t)
  )
(use-package py-autopep8
  :ensure t
  :hook
  ('before-save-hook #'py-autopep8-before-save)
  :bind
  (:map python-mode-map
        ("C-c F" .  py-autopep8)
        ("C-c f" . py-autopep8-region))
  )

;;;;;;;;;;;;;;;;;;;;
;; Common Lisp
(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl")
  )

;;;;;;;;;;;;;;;;;;;;
;; Rust
(use-package rust-mode
  :ensure t
  )

;;;;;;;;;;;;;;;;;;;;
;; Scala
(use-package scala-mode
  :ensure t
  :mode "\\.s\\(cala\\|bt\\)$"
  )
(use-package sbt-mode
  :ensure t
  :commands sbt-start sbt-command
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
  (setq sbt:program-options '("-Dsbt.supershell=false"))
  )
(use-package posframe
  :ensure t
  )
(use-package dap-mode
  :ensure t
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )

;;;;;;;;;;;;;;;;;;;;
;; Javascript
(setq js-indent-level 2)

;;;;;;;;;;;;;;;;;;;;
;; Yaml
(use-package yaml-mode
  :bind
  (:map yaml-mode-map
        ("C-m" . newline-and-indent))
  )

;;;;;;;;;;;;;;;;;;;;
;; Bazel
(use-package bazel-mode
  :ensure t
  )

;;;;;;;;;;;;;;;;;;;;
;; shell
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p) ; change modification right of files that starts with #!

;;;;;;;;;;;;;;;;;;;;
;; protocol buffer
(use-package protobuf-mode
  :ensure t
  :init
  (defconst my-protobuf-style
    '((c-basic-offset . 2)
      (indent-tabs-mode . nil)))
  :hook
  (add-hook lambda () (c-add-style "my-style" my-protobuf-style t))
  )





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Git
;;;;;;;;;;;;;;;;;;;;
;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  )

;;;;;;;;;;;;;;;;;;;;
;; Git-gutter-fringe+
(use-package git-gutter-fringe+
  :ensure t
  :config
  (global-git-gutter+-mode t)
  )




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Misc
;;;;;;;;;;;;;;;;;;;;
;; Company
(use-package company
  :ensure t
  :custom
  (company-transformers '(company-sort-by-backend-importance))
  (company-idle-delay 0)
  (company-echo-delay 0)
  (company-minimum-prefix-length 2)
  (company-selection-wrap-around t)
  (completion-ignore-case t)
  :bind
  (("C-M-c" . company-complete))
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("C-s" . company-filter-candidates)
        ("C-i" . company-complete-selection)
        ([tab] . company-complete-selection))
  (:map company-search-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :init
  (global-company-mode t)
  :config
  ;; prefer lowercase
  (defun my-sort-uppercase (candidates)
    (let (case-fold-search
          (re "\\`[[:upper:]]*\\'"))
      (sort candidates
            (lambda (s1 s2)
              (and (string-match-p re s2)
                   (not (string-match-p re s1)))))))
  (push 'my-sort-uppercase company-transformers)
  ;; coorperate with yasnippet
  (defvar company-mode/enable-yas t)
  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))
(use-package company-lsp
  :ensure t
  :commands company-lsp
  :custom
  (company-lsp-cache-candidates nil)
  (company-lsp-async t)
  (company-lsp-enable-recompletion t)
  (company-lsp-enable-snippet t)
  :after
  (:all lsp-mode lsp-ui company yasnippet)
  :init
  (push 'company-lsp company-backends))

;;;;;;;;;;;;;;;;;;;;
;; Ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 30)
  (setq ivy-extra-directories nil)
  (setq ivy-re-builders-alist
        '((t . ivy--regex-plus)))
  )

;;;;;;;;;;;;;;;;;;;;
;; Counsel
(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (counsel-mode t))

;;;;;;;;;;;;;;;;;;;;
;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  )

;;;;;;;;;;;;;;;;;;;;
;; Neotree
(use-package neotree
  :ensure t
  :bind ("C-q" . neotree-toggle)
  :config
  (setq neo-theme 'icon)
  (setq neo-persist-show t)
  (setq neo-smart-open t)
  (setq neo-smart-open t)
  )

;;;;;;;;;;;;;;;;;;;;
;; Org
;; Languages supports
(use-package ob-ipython
  :ensure t)
(use-package ob-rust
  :ensure t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   (ipython . t)
   (shell . t)
   (C . t)
   (emacs-lisp . t)
   (latex . t)
   (rust . t)
   ))
(setq org-src-fontify-natively nil)
(setq org-confirm-babel-evaluate nil)
(setq ob-async-no-aync-languages-alist '("ipython"))
(setq org-log-done 'time) ; set DONE timer

;;;;;;;;;;;;;;;;;;;;
;; file place
(setq org-directory "~/Dropbox/Org")
(setq org-default-notes-file "notes.org")

;;;;;;;;;;;;;;;;;;;;
;; org-capture
;; write
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/Dropbox/Org/notes.org" "Notes")
         "* %?\nEntered on %U\n %i\n %a")
        ))
;; read
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/Dropbox/Org/" file))))
(global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))

;;;;;;;;;;;;;;;;;;;;
;; org-journal
(use-package org-journal
  :ensure t
  :defer t
  :custom
  (org-journal-dir "~/Dropbox/Org/journal")
  (org-journal-date-format "%A, %d %B %Y"))

;;;;;;;;;;;;;;;;;;;;
;; Rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :config
  (custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
  :hook (prog-mode . rainbow-delimiters-mode))

;;;;;;;;;;;;;;;;;;;;
;; Yasnippet
(use-package yasnippet
  :ensure t
  :bind
  (:map yas-minor-mode-map
        ("C-x i n" . yas-new-snippet)
        ("C-x i v" . yas-visit-snippet-file)
        ("C-M-i"   . yas-insert-snippet))
  (:map yas-keymap
        ("<tab>" . nil)) ;; because of avoiding conflict with company keymap
  :init
  (yas-global-mode t))

;;;;;;;;;;;;;;;;;;;;
;; terminal
(use-package multi-term
  :ensure t
  :bind (("C-x C-c" . multi-term))
  :config
  (cond
   ((string-equal system-type "darwin")
    (setq multi-term-program "/usr/local/bin/zsh"))
   ((string-equal system-type "gnu/linux")
    (setq multi-term-program "/usr/bin/zsh"))))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;
;;; Keybinds
(defalias 'exit 'save-buffers-kill-emacs) ; exit alias
(global-set-key (kbd "C-<tab>") 'other-window) ; Change windows
(global-set-key (kbd "C-c l") 'toggle-truncate-lines) ; Toggle Truncate mode
(global-set-key (kbd "C-r") 'undo-fu-only-redo) ; Redo
(global-set-key (kbd "C-x ?") 'help-command) ; Help
(global-set-key (kbd "C-x C-q") 'save-buffers-kill-emacs) ; Stop unintenionally quitting Emacs
(global-set-key (kbd "M-h") 'backward-kill-word) ; Delete a word
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-right-option-modifier 'meta)
  )



;;;;;;;;;;;;;;;;;;;;
;; eshell keybinds
(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "C-p") 'eshell-previous-input)
            (define-key eshell-mode-map (kbd "C-n") 'eshell-next-input)
            ))
