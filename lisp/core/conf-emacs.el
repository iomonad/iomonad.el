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

(menu-bar-mode -1)
(set-language-environment "UTF-8")
(setq custom-file "~/.emacs.d/.custom.el")
(load custom-file)

;; Theming
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'sourcerer t)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
(set-face-attribute 'vertical-border nil :foreground (face-attribute 'fringe :background))

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

;; Switch between systems
(if (eq system-type 'darwin)
	(display-time-mode t)
  (when window-system
	(setq-default line-spacing 2)
	(set-face-font 'default "Monaco-12")
	(set-face-font 'variable-pitch "Monaco-12")
	(set-face-font 'fixed-pitch "Monaco-12")))

(if (eq system-type 'gnu/linux)
	(setq ring-bell-function 'ignore))

;; scrolling
(setq scroll-step            1
	  scroll-conservatively  10000)

;; line num
(require 'linum)
(set-face-attribute 'linum nil
					:background (face-attribute 'default :background)
					:foreground (face-attribute 'font-lock-comment-face :foreground))
(defface linum-current-line-face
  `((t :background "gray30" :foreground "white"))
  "Face for the currently active Line number")
(defvar my-linum-current-line-number 0)
(defun get-linum-format-string ()
  (setq-local my-linum-format-string
			  (let ((w (length (number-to-string
								(count-lines (point-min) (point-max))))))
				(concat " %" (number-to-string w) "d "))))
(add-hook 'linum-before-numbering-hook 'get-linum-format-string)
(defun my-linum-format (line-number)
  (propertize (format my-linum-format-string line-number) 'face
			  (if (eq line-number my-linum-current-line-number)
				  'linum-current-line-face
				'linum)))
(setq linum-format 'my-linum-format)
(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
	ad-do-it))
(ad-activate 'linum-update)
(global-linum-mode)

;; Powerline
(setq-default mode-line-format
			  (quote
			   (" "
				;; mode string
				(:propertize global-mode-string face 'mode-line-mode-string)

				;; file path
				(:propertize (:eval (if (> (length default-directory) 17)
										(concat "..." (substring default-directory -20))
									  default-directory))
							 face 'mode-line-folder-face)

				;; file name
				(:propertize mode-line-buffer-identification face 'mode-line-buffer-name)
				(:propertize mode-line-modified face 'mode-line-modified-face)
				"  "
				;; value of 'mode-name'
				(:propertize "%m" face 'mode-line-mode-name)
				" :: "
				;; line #
				"line %l, %p")))

;; Closes that parenthese
(electric-pair-mode 1)

;; reboot

(defun reboot-init ()
  (load-file "~/.emacs.d/init.el"))

;(setq user-init-file (or load-file-name (buffer-file-name)))
;(setq user-emacs-directory (file-name-directory user-init-file))

;; make it short
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'conf-emacs)
