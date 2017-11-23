(use-package flx-ido :ensure t)
(use-package ido-hacks :ensure t)
(use-package ido-vertical-mode :ensure t)

(use-package ido :ensure t
  :init (setq ido-case-fold t
			  ido-enable-flex-matching t
			  ido-use-filename-at-point 'guess
			  ido-create-new-buffer 'always)
  :config (progn
			(ido-everywhere 1)
			(flx-ido-mode 1)
			(ido-mode t)
			(ido-hacks-mode)
			(ido-vertical-mode)))

(setq ido-file-extensions-order '(".org" ".tex" ".el" ".txt" ".c" ".cpp" ".h" ".lisp"))


(setq flx-ido-use-faces t) ;; enable flx highlights
(flx-ido-mode 1)

(mapc (lambda (x)
		(add-to-list 'ido-ignore-directories x))
	  (list "target" "node_modules" "out"))
(mapc (lambda (x)
		(add-to-list 'ido-ignore-files x))
	  (list "\.bak" "\.o" "\.elc" "#*#" "*~" "\.a"))

(provide 'pkg-ido)
