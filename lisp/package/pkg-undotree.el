;; -*- lexical-binding: t -*-
(use-package undo-tree
  :ensure t)

(global-undo-tree-mode)
(defalias 'redo 'undo-tree-redo)

(provide 'pkg-undotree)
