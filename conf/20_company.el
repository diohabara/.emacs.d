;; (require 'company)
;; (global-company-mode)
;; (setq company-transformers '(company-sort-by-backend-importance))
;; (setq company-idle-delay 0)
;; (setq company-minimum-prefix-length 3)
;; (setq company-selection-wrap-around t)
;; (setq completion-ignore-case t)
;; (setq company-dabbrev-downcase nil)
;; (global-set-key (kbd "C-M-i") 'company-complete)
;; (define-key company-active-map (kbd "C-n") 'company-select-next)
;; (define-key company-active-map (kbd "C-p") 'company-select-previous)
;; (define-key company-search-map (kbd "C-n") 'company-select-next)
;; (define-key company-search-map (kbd "C-p") 'company-select-previous)
;; (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
;; (define-key company-active-map (kbd "C-i") 'company-complete-selection)
;; (define-key company-active-map [tab] 'company-complete-selection)
;; (define-key company-active-map (kbd "C-f") 'company-complete-selection)
;; (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

(use-package company
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
  ;; lowercaseを優先にするソート
  (defun my-sort-uppercase (candidates)
    (let (case-fold-search
          (re "\\`[[:upper:]]*\\'"))
      (sort candidates
            (lambda (s1 s2)
              (and (string-match-p re s2)
                   (not (string-match-p re s1)))))))

  (push 'my-sort-uppercase company-transformers)

  ;; yasnippetとの連携
  (defvar company-mode/enable-yas t)
  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))

(use-package company-lsp
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
