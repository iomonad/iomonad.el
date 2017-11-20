;; File: conf-emacs.el
;; Author: iomonad me@trosa.io

(setq debug-on-error t
      gc-cons-threshold 100000000
      load-prefer-newer t
      sentence-end-double-space nil
      frame-title-format "Emacs - %b"
      time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S"
      inhibit-startup-message t
      inhibit-splash-screen t
      case-fold-search t
      kill-whole-line t
      require-final-newline t
      next-line-add-newlines nil
      backup-inhibited t
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil
      vc-follow-symlinks t
      password-cache-expiry nil
      highlight-tabs t
      show-trailing-whitespace t
      whitespace-line-column 80
      whitespace-style '(tabs tab-mark face lines-tail)
      whitespace-global-modes '(not org-mode web-mode)
      uniquify-buffer-name-style 'forward uniquify-separator "/"
      backup-directory-alist `(("." . "~/.emacs.d/saves"))
      make-backup-files 1
      auto-save-list-file-prefix nil
      auto-save-default nil)

(menu-bar-mode 0)

(setq custom-file "~/.emacs.d/.custom.el")
(load custom-file)


(add-to-list 'custom-theme-load-path
             (concat user-emacs-directory "themes/"))

(when window-system
  (setq-default line-spacing 2)
  (set-face-font 'default "Source Code Pro-11")
  (set-face-font 'variable-pitch "Lucida Grande-11")
  (set-face-font 'fixed-pitch "Source Code Pro-11"))

(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq linum-relative-current-symbol "")

(setq initial-scratch-message ";;_
;;                 __         _,******
;;   ,-----,        _  _,**
;;   | Mu! |          _   ____,****
;;   ;-----;        _
;;        \\   ^__^
;;         \\  (^^)\\_______
;;          ^-(..)\\       )\\/\\/^_^
;;                ||----w |
;; __.-''*-,.,____||_____||___,_.-
;;                 ''     ''
")

(provide 'conf-emacs)
