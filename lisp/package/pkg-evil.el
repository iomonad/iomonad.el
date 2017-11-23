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

;; leader ftw
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

;; Lead for evil
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

;; Oh boi
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)
(define-key evil-normal-state-map (kbd "C-k") 'kll-line)
(define-key evil-normal-state-map (kbd "C-n") 'next-line)
(define-key evil-normal-state-map (kbd "C-p") 'previous-line)
(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)

(define-key evil-normal-state-map (kbd "C-w") 'copy)
(define-key evil-normal-state-map (kbd "C-y") 'yank)
(define-key evil-insert-state-map (kbd "C-w") 'copy)
(define-key evil-insert-state-map (kbd "C-y") 'yank)

(provide 'pkg-evil)
