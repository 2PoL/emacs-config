;;; ++misc.el -*- lexical-binding: t; -*-

;;default dictionary
(setq default-directory "~/Public/Playgrounds")

;;org default dictionary
(setq org-directory "~/Dropbox/Org")

;;format-all
(map! :n "<f4>" 'format-all-buffer)

;;expand-region
(use-package! expand-region
  :defer 5
  :config
  (pending-delete-mode t)
  :bind
  ("M-2" . 'er/expand-region))

(set-language-environment "UTF-8")

;; Delete the selection when pasting
(delete-selection-mode 1)

;; (use-package! lsp-python-ms
;;   :defer 5
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-python-ms)
;;                          (lsp))))  ;; or lsp-deferred

;;Package cl is deprecated
(require 'loadhist)
(file-dependents (feature-file 'cl))

(add-hook! 'org-mode-hook (company-mode -1))

;;Magit forge
(setq auth-sources '("~/.authinfo"))

;; Use minibuffer to display some ivy functions
(setq ivy-posframe-display-functions-alist
      '((swiper          . ivy-posframe-display-at-frame-center)
        (describe-variable . ivy-display-function-fallback)
        (describe-function . ivy-display-function-fallback)
        (counsel-M-x     . ivy-display-function-fallback)
        (t               .ivy-posframe-display)))
(ivy-posframe-mode 1)
;; delete to trash
(setq delete-by-moving-to-trash t)
