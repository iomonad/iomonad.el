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
  "k"  'kill-buffer
  "t"  'neotree-toggle
  "u"  'undo
  "r"  'redo
  "`"  'header-insert
  "s"  'magit-status
  "v"  'undo-tree-visualize
  "g"  'keyboard-escape-quit
  "x"  'save-buffers-kill-emacs
  "o"  'split-window-vertically
  "p"  'split-window-horizontally
  "|"  'toggle-window-split
  "e"  'find-file)

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
  "\\" 'evilnc-comment-operator)

(provide 'pkg-evil)
