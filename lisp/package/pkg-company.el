;; -*- lexical-binding: t -*-

(use-package company :ensure t
  :init (setq company-auto-complete nil
			  company-tooltip-flip-when-above t
			  company-minimum-prefix-length 2
			  company-tooltip-limit 20
			  company-idle-delay 0.5)
  :config (global-company-mode 1)
  :diminish company-mode)

(provide 'pkg-company)
