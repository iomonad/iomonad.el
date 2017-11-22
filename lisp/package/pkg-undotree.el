;; -*- lexical-binding: t -*-
(use-package undo-tree
  :ensure t)

(global-undo-tree-mode)
(defalias 'redo 'undo-tree-redo)

(define-key neotree-mode-map (kbd "h") 'neotree-enter-horizontal-split)
(define-key neotree-mode-map (kbd "v") 'neotree-enter-vertical-split)

(define-key evil-motion-state-local-map (kbd "?")    'evil-search-backward)
(define-key evil-motion-state-local-map (kbd "c")    'neotree-create-node)
(define-key evil-motion-state-local-map (kbd "d")    'neotree-delete-node)
(define-key evil-motion-state-local-map (kbd "gr")   'neotree-refresh)
(define-key evil-motion-state-local-map (kbd "H")    'neotree-select-previous-sibling-node)
(define-key evil-motion-state-local-map (kbd "J")    'neotree-select-down-node)
(define-key evil-motion-state-local-map (kbd "K")    'neotree-select-up-node)
(define-key evil-motion-state-local-map (kbd "L")    'neotree-select-next-sibling-node)
(define-key evil-motion-state-local-map (kbd "q")    'neotree-hide)
(define-key evil-motion-state-local-map (kbd "r")    'neotree-rename-node)
(define-key evil-motion-state-local-map (kbd "R")    'neotree-change-root)
(define-key evil-motion-state-local-map (kbd "s")    'neotree-hidden-file-toggle)

(provide 'pkg-undotree)
