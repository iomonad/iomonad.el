;; -*- lexical-binding: t -*-

(use-package yasnippet :ensure t
  :functions yas-global-mode
  :diminish yas-minor-mode
  :defer 5)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/community"  ;; Community Snippets
        "~/.emacs.d/snippets/custom"     ;; User custom snippets
        ))

(yas-global-mode 1)

(provide 'pkg-yasnippets)
