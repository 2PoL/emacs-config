;;; ++mycc.el -*- lexical-binding: t; -*-

(after! cc-mode
  (c-add-style
   "my-cc" '("user"
             (c-basic-offset . 2)
             (c-offsets-alist
              . ((innamespace . 0)
                 (access-label . -)
                 (case-label . 0)
                 (member-init-intro . +)
                 (topmost-intro . 0)
                 (arglist-cont-nonempty . +)))))
  (setq c-default-style "my-cc"))

;; clangd with eglot
;; (use-package! eglot
;;   :defer 5
;;   :config
;;   (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;;   (add-hook 'c++-mode-hook 'eglot-ensure)
;;   (add-hook 'c-mode-hook 'eglot-ensure)
;;   )

;; evil match it
(use-package! evil-matchit
  :defer 5
  :config
  (setq evilmi-shortcut "m"
        evilmi-quote-chars (string-to-list "'\"/"))
  (global-evil-matchit-mode 1)
  )

;; clangd with lsp
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(setq +format-with-lsp nil)

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil
        lsp-ui-imenu-enable nil
        lsp-ui-sideline-enable nil
        lsp-ui-doc-include-signature nil
        lsp-ui-doc-max-height 15
        lsp-ui-doc-max-width 20
        lsp-ui-doc-position 'at-point))
