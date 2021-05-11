;;; ++misc.el -*- lexical-binding: t; -*-

;;default dictionary
(setq default-directory "~/Public/Playgrounds")

;;org default dictionary
(setq org-directory "~/Dropbox/Org")

;;format-all
(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
            sql-mode         ; sqlformat is currently broken
            tex-mode         ; latexindent is broken
            latex-mode))
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TRASH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; delete to trash
(setq delete-by-moving-to-trash t)

(setq vterm-module-cmake-args "-DUSE_SYSTEM_LIBVTERM=yes")
