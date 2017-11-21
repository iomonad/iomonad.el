(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)

(defun c-tth ()
  (setq-default indent-tabs-mode t)
  (setq-default tab-width 4)
  (setq c-set-style "k&r")
  (setq c-basic-offset 4))

;; Auto indent
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))
(add-hook 'c-mode-common-hook 'c-tth)
(add-hook 'c-mode-common-hook
		  (lambda () 
			(add-hook 'before-save-hook 'header-update)))
(setq-default c-default-style "linux")
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
								64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
(setq-default c-backspace-function 'backward-delete-char)
(c-add-style "openbsd"
			 '("bsd"
			   (c-backspace-function . delete-backward-char)
			   (c-syntactic-indentation-in-macros . nil)
			   (c-tab-always-indent . nil)
			   (c-hanging-braces-alist
				(block-close . c-snug-do-while))
			   (c-offsets-alist
				(arglist-cont-nonempty . *)
				(statement-cont . *))
			   (indent-tabs-mode . t)))

(global-set-key (kbd "TAB") 'self-insert-command)
(setq-default tab-always-indent 'complete)
(provide 'lang-c)
