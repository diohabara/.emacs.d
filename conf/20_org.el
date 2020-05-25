;;; set DONE timer
(setq org-log-done 'time)

;;; file place
(setq org-directory "~/Dropbox/Org")
(setq org-default-notes-file "notes.org")

;;; org-capture
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

;;; org-journal
(use-package org-journal
  :ensure t
  :defer t
  :custom
  (org-journal-dir "~/Dropbox/Org/journal")
  (org-journal-date-format "%A, %d %B %Y"))
