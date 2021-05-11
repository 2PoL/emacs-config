;;; ++ui.el -*- lexical-binding: t; -*-

(setq initial-frame-alist
      '((top . 200) (left . 600) (width . 120) (height . 46)))

;; (desktop-save-mode 1)
;; (setq desktop-dir "~/Dropbox/doc/")
;; (desktop-read desktop-dir)

(setq display-line-numbers-type t)

(load-theme 'doom-one-light t)

;;setup doom-banner
(setq fancy-splash-image "~/.doom.d/banner/Amadeus.png")

(set-frame-parameter nil 'alpha 0.96)

;;(setq doom-font (font-spec :family "JetBrains Mono" :size 15))
(defun +my/better-font()
  (interactive)
  ;; english font
  (if (display-graphic-p)
      (progn
        (set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "JetBrains Mono" 15)) ;; 11 13 17 19 23
        ;; chinese font
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "Source Han Serif")))) ;; 14 16 20 22 28
    ))

(defun +my|init-font(frame)
  (with-selected-frame frame
    (if (display-graphic-p)
        (+my/better-font))))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions #'+my|init-font)
  (+my/better-font))

(setq evil-emacs-state-cursor `(box ,(doom-color 'violet)))

(after! doom-modeline
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project
        doom-modeline-major-mode-icon t
        ;; My mac vsplit screen won't fit
        doom-modeline-window-width-limit 20))

(setq +workspaces-on-switch-project-behavior t)

(custom-theme-set-faces! doom-theme
  `(font-lock-comment-face :foreground ,(doom-color 'blue))
  `(font-lock-doc-face :foreground ,(doom-color 'blue)))

(when IS-MAC
  ;; enable ligatures support
  ;; details here: https://github.com/tonsky/FiraCode/wiki/Emacs-instructions
  (ignore-errors
    (mac-auto-operator-composition-mode)))

;;nyan-cat
(use-package! nyan-mode
  :defer 5
  :config
  (nyan-mode t)
  :init
  (setq nyan-animate-nyancat t)
  (setq nyan-wavy-trail t)
  )


(after! ibuffer
  ;; set ibuffer name column width
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (cond(setq doom-modeline-lsp t)
         ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
         ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
         (t (format "%8d" (buffer-size)))))

  (setq ibuffer-formats
        '((mark modified read-only " "
                (name 50 50 :left :nil) " "
                (size-h 9 -1 :right) " "
                (mode 16 16 :left :elide) " "
                filename-and-process))))

(use-package! all-the-icons-ibuffer
  :after ibuffer
  :init (all-the-icons-ibuffer-mode 1)
  )

(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))
