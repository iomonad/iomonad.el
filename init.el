;;; -*- lexical-binding: t; -*-;; File:     ~/.emacs.d/emacs-init.el
;; Author:   iomonad <me@trosa.io>
;; https://github.com/iomonad/iomonad.el
;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar *config-dir*
  (expand-file-name (convert-standard-filename "lisp")
		    user-emacs-directory))

(defvar *cfg-core*
  (concat (file-name-as-directory *config-dir*)
	  "core"))
(defvar *cfg-pkg*
  (concat (file-name-as-directory *config-dir*)
	  "package"))
(defvar *cfg-libs*
  (concat (file-name-as-directory *config-dir*)
	  "libs"))
(defvar *cfg-langs*
  (concat (file-name-as-directory *config-dir*)
	  "languages"))
(defvar *cfg-exp*
  (concat (file-name-as-directory *config-dir*)
	  "experimental"))

(defvar *defun-dir*
  (expand-file-name (convert-standard-filename "defun")
		    user-emacs-directory))
(defvar *plugins-dir*
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

(mapc (lambda (x)
	(load-config-folders x))
      (list *cfg-core*
	    *cfg-pkg*
	    *cfg-libs*
	    *cfg-langs*
	    *cfg-exp*
	    *defun-dir*
	    *plugins-dir*))
