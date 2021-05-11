;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))
  (require 'benchmark-init-modes)
  (require 'benchmark-init)
  (benchmark-init/activate)
  ;; 下面才写你的其它配置


  (load! "++ui")
  (load! "++mycc")
  (load! "++misc")

  (setq user-full-name "2PoL"
        user-mail-address "onpluto@outlook.com")

  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))

  (setq doom-scratch-buffer-major-mode 'emacs-lisp-mode
        confirm-kill-emacs nil)

  (setq-default fill-column 120
                delete-trailing-lines t)

  )
