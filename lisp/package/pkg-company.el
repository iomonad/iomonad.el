;; -*- lexical-binding: t -*-
(use-package company
  :ensure t)

(add-hook 'after-init-hook 'global-company-mode)

(provide 'pkg-company)
