;;; ++misc.el -*- lexical-binding: t; -*-

;;default dictionary
(setq default-directory "~/Public/Playgrounds")

;;org default dictionary
(setq org-directory "~/Dropbox/Org")

;;format-all
(map! :n "<f4>" 'format-all-buffer)

;;expand-region
;; (use-package! expand-region
;;   :defer 5
;;   :config
;;   (pending-delete-mode t)
;;   :bind
;;   ("M-2" . 'er/expand-region))

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
;; Different command can use different display function.
(after! ivy-posframe
  (setq ivy-posframe-height-alist '((swiper . 20)
                                    (counsel-M-x . 10)
                                    (t      . 25)))
  (setq ivy-posframe-display-functions-alist
        '((swiper          . ivy-display-function-fallback)
          (describe-variable . ivy-display-function-fallback)
          (counsel-M-x     . ivy-display-function-fallback)
          (t               . ivy-posframe-display))
        )
  )
(after! ivy-rich
  (plist-put! ivy-rich-display-transformers-list
              'ivy-switch-buffer
              '(:columns
                ((ivy-switch-buffer-transformer (:width 60))
                 (ivy-rich-switch-buffer-size (:width 7))
                 (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
                 (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
                 (ivy-rich-switch-buffer-project (:width 15 :face success))
                 (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
                :predicate
                (lambda (cand) (get-buffer cand)))))

;; delete to trash
(setq delete-by-moving-to-trash t)


;;projectile
(after! projectile
  (setq compilation-read-command nil)   ; no prompt in projectile-compile-project
  ;; . -> Build
  (projectile-register-project-type 'cmake '("CMakeLists.txt")
                                    :configure "cmake %s"
                                    :compile "cmake --build Debug"
                                    :test "ctest"))
