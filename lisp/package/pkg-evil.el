;; -*- lexical-binding: t -*-
(use-package evil
  :ensure t)
(use-package evil-leader
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
  "v"  'undo-tree-visualize
  "g"  'keyboard-escape-quit
  "x"  'save-buffers-kill-emacs
  "e"  'find-file)

(provide 'pkg-evil)
