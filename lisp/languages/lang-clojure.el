(use-package clojure-mode
	:ensure t)
(use-package rainbow-delimiters
	:ensure t)


;; Turn on auto-completion with Company-Mode
(show-paren-mode 1)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

(provide 'lang-clojure)
