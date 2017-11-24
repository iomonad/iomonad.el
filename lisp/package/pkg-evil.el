;; -*- lexical-binding: t -*-
(use-package evil
  :ensure t)
(use-package evil-leader
  :ensure t)
(use-package evil-nerd-commenter
  :ensure t)

(require 'evil)
(require 'evil-leader)
(evil-mode 1)
(global-evil-leader-mode)

;; ~~ leader single ~~
(evil-leader/set-leader ",")
(evil-leader/set-key
  "b"  'switch-to-buffer
  "w"  'save-buffer
  "t"  'neotree-toggle
  "u"  'undo
  "r"  'redo
  "`"  'header-insert
  "y"  'undo-tree-visualize
  "x"  'save-buffers-kill-emacs
  "u"  'org-insert-link
  "o"  'other-window
  "d"  'delete-window
  "D"  'delete-other-windows
  "h"  'split-window-below
  "v"  'split-window-right
  "k"  'kill-buffer
  "K"  'kill-buffer-and-window
  "f"  'dired
  "e"  'helm-find-files)

;; ~~ leader multi ~~
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "."  'evilnc-copy-and-comment-operator
  "gs" 'magit-status
  "\\" 'evilnc-comment-operator)

;; ~~ keep emacs goodness ~~
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)
(define-key evil-normal-state-map (kbd "C-k") 'kill-line)
(define-key evil-normal-state-map (kbd "C-n") 'next-line)
(define-key evil-normal-state-map (kbd "C-p") 'previous-line)
(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)

(define-key evil-normal-state-map (kbd "C-w") 'copy)
(define-key evil-normal-state-map (kbd "C-y") 'yank)
(define-key evil-insert-state-map (kbd "C-w") 'copy)
(define-key evil-insert-state-map (kbd "C-y") 'yank)

;; ~~ wrap selection ~~
(define-key evil-visual-state-map (kbd "(")  'insert-pair)
(define-key evil-visual-state-map (kbd "[")  'insert-pair)
(define-key evil-visual-state-map (kbd "{")  'insert-pair)
(define-key evil-visual-state-map (kbd "\"") 'insert-pair)
(define-key evil-visual-state-map (kbd "\'") 'insert-pair)

;; ~~ rectangle selector ~~
(define-key evil-visual-state-map (kbd "r") 'string-rectangle)

;; ~~ exit in insert ~~
(define-key evil-insert-state-map (kbd "C-g") 'evil-force-normal-state)
(global-set-key (kbd "C-<up>") 'move-text-up)
(global-set-key (kbd "C-<down>") 'move-text-down)

;; ~~ evil ffmove bae ~~
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key (kbd "M-/") 'replace-under-cursor)


;; ~~ Mode Line ~~
;; ~~ Copyright: crshd ~~
(make-face 'mode-line-evil)
(make-face 'mode-line-padder)
(set-face-attribute 'mode-line-evil nil :box nil)
(set-face-attribute 'mode-line-padder nil :box '(:line-width 4 :color "grey20"))

(add-to-list 'load-path (concat *vendor-dir* "/evil-plugins/"))
(require 'evil-mode-line)

(which-function-mode)

(setq powerline-text-scale-factor 1)

(defun ml/fill (face reserve)
	"Return empty space using FACE and leaving RESERVE space on the right."
	(unless reserve
		(setq reserve 20))
	(when powerline-text-scale-factor
		(setq reserve (* powerline-text-scale-factor reserve)))
	(when (and window-system (eq 'right (get-scroll-bar-mode)))
		(setq reserve (- reserve 3)))
	(propertize " "
							'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
							'face face))
(defun ml/width (values)
	"Get the length of VALUES."
	(if values
			(let ((val (car values)))
				(+ (cond
						((stringp val) (length (format-mode-line val)))
						((and (listp val) (eq 'image (car val)))
						 (car (image-size val)))
						(t 0))
					 (ml/width (cdr values))))
		0))
(defun ml/item-render (item)
	"Render a powerline ITEM."
	(cond
	 ((and (listp item) (eq 'image (car item)))
		(propertize " " 'display item
								'face (plist-get (cdr item) :face)))
	 (item item)))
(defun ml/render (values)
	"Render a list of powerline VALUES."
	(mapconcat 'ml/item-render values ""))
(defun ml/format (value fontface)
	(propertize (format-mode-line value) 'face fontface))
(defun ml/column ()
	(propertize "%c" 'face
							(if (>= (current-column) 80)
									'mode-line-80col
								'mode-line-col)))
(defun makemodeline ()
	(setq-default mode-line-format
								'(""
									(:eval
									 (let* ((lhs (list
																(ml/format evil-mode-line-msg 'mode-line-evil)
																" ** "
																(ml/format "%b" 'mode-line-buffer-name)
																" "
																(ml/format mode-name 'mode-line-mode)
																(ml/format minor-mode-alist 'mode-line-minor-mode)))
													(rhs (list
																(ml/format which-func-format 'mode-line-func)
																" "
																(ml/format "%4l:" 'mode-line-line)
																(ml/column))))
										 (concat (ml/render lhs)
														 (ml/fill 'mode-line-line-face (ml/width rhs))
														 (ml/render rhs)))))))
(makemodeline)
(defvar mode-line-cleaner-alist
	`((auto-complete-mode . "")
		(yas-minor-mode . "")
		(smartparens-mode . " Φ")
		(eldoc-mode . "")
		(abbrev-mode . "")
		(undo-tree-mode . "")
		(volatile-highlights-mode . " υ")
		(elisp-slime-nav-mode . " δ")
		(nrepl-mode . " ηζ")
		(nrepl-interaction-mode . " ηζ")
		(git-gutter+-mode . "")
		;; Major modes
		(clojure-mode . "λ")
		(hi-lock-mode . "")
		(python-mode . "Py")
		(emacs-lisp-mode . "ELisp")
		(markdown-mode . "MDown"))
	"Alist for `clean-mode-line'.
When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

(defun clean-mode-line ()
	(interactive)
	(loop for cleaner in mode-line-cleaner-alist
				do (let* ((mode (car cleaner))
									(mode-str (cdr cleaner))
									(old-mode-str (cdr (assq mode minor-mode-alist))))
						 (when old-mode-str
							 (setcar old-mode-str mode-str))
						 ;; major mode
						 (when (eq mode major-mode)
							 (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

(provide 'pkg-evil)
