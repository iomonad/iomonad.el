;; File:     ~/.emacs.d/emacs-init.el
;; Author:   iomonad <me@trosa.io>
;; https://github.com/iomonad/iomonad.el
;;

(defvar *config-dir*
  "Set global config path folder to load"
  (expand-file-name (convert-standard-filename "lisp")
					user-emacs-directory))

(defvar *cfg-core*
  "Subfolder config path that contains core
   configurations"
  (concat (file-name-as-directory *config-dir*)
		  "core"))
(defvar *cfg-pkg*
  "Subfolder config path that contains package
   configurations"
  (concat (file-name-as-directory *config-dir*)
		  "package"))
(defvar *cfg-langs*
  "Subfolder config path that contains langages
   related config files"
  (concat (file-name-as-directory *config-dir*)
		  "languages"))
(defvar *cfg-exp*
  "Playground folder where some features can breaks."
  (concat (file-name-as-directory *config-dir*)
		  "experimental"))

(defvar *defun-dir*
  "Custom declared functions or tricks are stored here"
  (expand-file-name (convert-standard-filename "defun")
					user-emacs-directory))
(defvar *plugins-dir*
  "One file external plugins stored here are  loaded
   at emacs's boot"
  (expand-file-name (convert-standard-filename "plugins")
					user-emacs-directory))

(defun load-config-folders (config-folders)
  "For each folder in emacs's path, load
   configuration file and show a load message"
  (if (file-exists-p config-folders)
	  (progn (add-to-list 'load-path config-folders)
			 (mapc (lambda (fname)
					 (let ((feat (intern (file-name-base fname))))
					   (message "Feature '%s' wijze." feat)
					   (require feat fname)))
				   (directory-files config-folders t "\\.el")))
	(message "Directory \"%s\" niet gevonden. Geen extensies zijn geladen." config-folders)))


(defun boot ()
  "Entry point hook"
  (mapc (lambda (x)
		  (load-config-folders x))
		'(*cfg-core*
		  *cfg-pkg*
		  *cfg-langs*
		  *cfg-exp*
		  *defun-dir*
		  *plugins-dir*)))

(load-config-folders *cfg-core*)
