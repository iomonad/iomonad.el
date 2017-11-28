;; Eshell configuration

(require 'dash)
(require 's)

;; ~~ Core configuration ~~
(use-package eshell
  :init
  (setq
   eshell-scroll-to-bottom-on-input 'all
   eshell-error-if-no-glob t
   eshell-hist-ignoredups t
   eshell-save-history-on-exit t
   eshell-prefer-lisp-functions nil
   eshell-cmpl-cycle-completions nil
   eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'"
   eshell-destroy-buffer-when-process-dies t))

;; ~~ Set visual applications ~~
(use-package eshell
  :init
  (add-hook 'eshell-mode-hook
            (lambda ()
              (add-to-list 'eshell-visual-commands "ssh")
              (add-to-list 'eshell-visual-commands "tail")
              (add-to-list 'eshell-visual-commands "top"))))

;; ~~ Fix it ~~
(setenv "PAGER" "cat")

;; ~~ Aliases ~~
(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell/alias "e" "find-file $1")
            (eshell/alias "ff" "find-file $1")
            (eshell/alias "emacs" "find-file $1")
            (eshell/alias "ee" "find-file-other-window $1")
            (eshell/alias "gd" "magit-diff-unstaged")
            (eshell/alias "gds" "magit-diff-staged")
            (eshell/alias "d" "dired $1")
            (let ((ls (if (file-exists-p "/usr/local/bin/gls")
                          "/usr/local/bin/gls"
                        "/bin/ls")))
              (eshell/alias "ll" (concat ls " -AlohG --color=always")))))

;; ~~ Fuck C-l ~~
(defun eshell/clear ()
  "Clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

;; ~~ Map it ~~
(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "C-l") 'eshell/clear)))

;; ~~ Set path ~~
(setenv "PATH"
        (concat
         "~/.brew/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/munki:"
         (getenv "PATH")))

;; ~~ Rice that prompt ~~
(setq eshell-prompt-function
      (lambda nil
        (concat
         "[" (user-login-name) "@" (getenv "HOSTNAME") ":"
         (eshell/pwd)
         "]$ ")))

;; ~~ Handle colors ~~
(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)

(provide 'conf-eshell)
