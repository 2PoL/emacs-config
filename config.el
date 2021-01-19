;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "2PoL"
      user-mail-address "onpluto@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Monaco" :size 15))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Public/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
;;position of window
(setq inhibit-splash-screen 1)
(set-frame-position (selected-frame) 600 300)
(pushnew! initial-frame-alist '(width . 155) '(height . 48))
(set-frame-parameter nil 'alpha 0.96)
;;nyan-cat
(use-package! nyan-mode
  :ensure t
  :config
  (nyan-mode t)
  :init
  ;; (nyan-start-animation)
  (setq nyan-wavy-trail nil)
  )
;;banner
(setq dashboard-startup-banner "/Users/hyue/.doom.d/Amadeus.png")
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;default dictionary
(setq default-directory "/Users/hyue/Public/Code")
;;format-all
(use-package! format-all
  :ensure t
  :bind
  ("<f4>" . format-all-buffer)
  )
;;expand-region
(use-package! expand-region
  :ensure t
  :config
  (pending-delete-mode t)
  :bind
  ("M-2" . 'er/expand-region))
(use-package! smartparens
  :bind
  ("M-d" . sp-kill-hybrid-sexp)
  )

;;setup doom-banner
(setq fancy-splash-image "~/.doom.d/banner/Amadeus.png")

;;lsp
(use-package! lsp-ui)
(map! "<f3>" 'lsp-ui-imenu)
(use-package! lsp-treemacs :commands lsp-treemacs-errors-list)

(push 'company-lsp company-backends)
(add-hook! 'c++-mode-hook #'lsp)
(add-hook! 'c-mode-hook #'lsp)

;;ccls
(require 'ccls)
(setq ccls-executable "/path/to/ccls/Release/ccls")

(after! ccls
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
  (set-lsp-priority! 'ccls 2)
  (setq ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight)
  ) ;;optional as ccls is the default in Doom

(use-package! lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp))))  ;; or lsp-deferred
