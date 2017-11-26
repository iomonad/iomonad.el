;; FiLe: conf-emacs.el
;; Author: iomonad me@trosa.io

;; ~~ Global Block ~~
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

;; ~~ Debloat init ~~
(menu-bar-mode -1)
(set-language-environment "UTF-8")
(setq custom-file "~/.emacs.d/.custom.el")
(load custom-file)

;; ~~ Fall Back Theme ~~
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'sourcerer t)


;; ~~ Os Specific ~~
(defmacro with-system (type &rest body)
  "Trivial macros that define which
        os is running. Use to parse os conf"
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

;; Switch between systems
(with-system "darwin"
  (display-time-mode t)
  (when window-system
    (setq-default line-spacing 2)
    (set-face-font 'default "Monaco-12")
    (set-face-font 'variable-pitch "Monaco-12")
    (set-face-font 'fixed-pitch "Monaco-12")))
(with-system "gnu/linux"
  (setq ring-bell-function 'ignore)
  (setq-default line-spacing 2)
  (when window-system
    (set-face-font 'default "Pragmatapro-9")
    (set-face-font 'variable-pitch "Pragmatapro-9")
    (set-face-font 'fixed-pitch "Pragmatapro-9"))) ; Gentoo thinkpad x220


;; ~~ Where we are ~~
(global-hl-line-mode 1)
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; ~~ Graphical mode spec ~~
(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
(set-face-attribute 'vertical-border nil :foreground (face-attribute 'fringe :background))

;; ~~ Pretty useless uhu ?? ~~
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

;; ~~ Scrollings sucks, fix it ~~
(setq scroll-step            1
      scroll-conservatively  10000)

;; ~~ Line Num, with steroids. ~~
(require 'linum)
(set-face-attribute 'linum nil
                    :background (face-attribute 'default :background)
                    :foreground (face-attribute 'font-lock-comment-face :foreground))
(defface linum-current-line-face
  `((t :background "black"
       :foreground "white"))
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

;; ~~ Should be illegal for lispers ~~
(electric-pair-mode 1)

;; ~~ For the lazy ~~
(defalias 'yes-or-no-p 'y-or-n-p)

;; ~~ Theme Dispatcher ~~
(with-system darwin ;; Imac 
  (if (display-graphic-p)
      (progn
        (load-theme 'erosion t))
    (load-theme 'sourcerer t)))
(with-system gnu/linux ;; Thinkpad x200 Gentoo.
  (if (display-graphic-p)
      (progn
        (set-face-font 'default "Pragmatapro-9")
        (set-face-font 'variable-pitch "Pragmatapro-9")
        (set-face-font 'fixed-pitch "Pragmatapro-9") ; Gentoo thinkpad x220
        (load-theme 'erosion t))
    (load-theme 'sourcerer t)))

;; ~~ Split bars ~~
(set-face-background 'vertical-border "black")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

(custom-set-faces
 '(mode-line-inactive ((t (:background nil)))))

(setq lambda-symbol "λ")

(provide 'conf-emacs)
