;; File:     ~/.emacs.d/emacs-init.el
;; Author:   iomonad <me@trosa.io>
;; https://github.com/iomonad/iomonad.el
;;

(defvar *config-dir*
  "Set global config path folder to load"
  (expand-file-name (convert-standard-filename "lisp")
					user-emacs-directory))