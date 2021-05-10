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

;; clangd with lsp
;; (setq lsp-clients-clangd-args '("-j=3"
;;                                 "--background-index"
;;                                 "--clang-tidy"
;;                                 "--completion-style=detailed"
;;                                 "--header-insertion=never"))
;; (after! lsp-clangd (set-lsp-priority! 'clangd 2))

;; (use-package! company-lsp
;;   :defer 5
;;   :config
;;   (push 'company-lsp company-backends))
;; (add-hook! 'c-mode-hook #'lsp)
;; (add-hook! 'c++-mode-hook #'lsp)

;; clangd with eglot
(use-package! eglot
  :defer 5
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'c-mode-hook 'eglot-ensure)
  )



(setq +format-with-lsp nil)
(after! lsp-mode
  (setq lsp-print-io nil
        lsp-file-watch-threshold 3000)
  (dolist (dir '("[/\\\\]\\.ccls-cache$"
                 "[/\\\\]\\.mypy_cache$"
                 "[/\\\\]\\.pytest_cache$"
                 "[/\\\\]\\.cache$"
                 "[/\\\\]\\.clwb$"
                 "[/\\\\]_build$"
                 "[/\\\\]__pycache__$"
                 "[/\\\\]bazel-bin$"
                 "[/\\\\]bazel-code$"
                 "[/\\\\]bazel-genfiles$"
                 "[/\\\\]bazel-out$"
                 "[/\\\\]bazel-testlogs$"
                 "[/\\\\]third_party$"
                 "[/\\\\]third-party$"
                 ))

    (push dir lsp-file-watch-ignored))
  )

;; (after! lsp-ui
;;   (setq lsp-ui-sideline-enable nil
;;         lsp-ui-imenu-enable nil
;;         lsp-ui-sideline-enable nil
;;         lsp-ui-doc-include-signature nil
;;         lsp-ui-doc-max-height 15
;;         lsp-ui-doc-max-width 100
;;         lsp-ui-doc-position 'at-point))