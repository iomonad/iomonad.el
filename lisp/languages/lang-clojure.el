(use-package clojure-mode
	:ensure t)
(use-package cider
	:ensure t)
(use-package rainbow-delimiters
	:ensure t)

;; Enter cider mode when entering the clojure major mode
(add-hook 'clojure-mode-hook 'cider-mode)

;; Turn on auto-completion with Company-Mode
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-mode-hook '(lambda ()
															(setq cider-eval-result-prefix ";; => ")
															(setq cider-save-file-on-load t)
															(setq cider-save-file-on-load nil)
															(setq cider-prefer-local-resources t)))
(show-paren-mode 1)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; Replace return key with newline-and-indent when in cider mode.
(add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
(provide 'lang-clojure)
