;;; elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;; auto indent
(require 'py-autopep8)
(define-key python-mode-map (kbd "C-c F") 'py-autopep8)          ; バッファ全体のコード整形
(define-key python-mode-map (kbd "C-c f") 'py-autopep8-region)   ; 選択リジョン内のコード整形

;; 保存時にバッファ全体を自動整形する
(add-hook 'before-save-hook 'py-autopep8-before-save)
