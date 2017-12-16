(use-package intero
  :ensure t)

(add-hook 'haskell-mode-hook
  (lambda ()
    (setq mode-name " λ ")
		(setq-default indent-tabs-mode nil)))

(add-hook 'haskell-mode-hook 'intero-mode)

(provide 'lang-haskell)
