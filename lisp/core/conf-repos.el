;; Filename: conf-repos.el
;; Author: iomonad <me@trosa.io>
;; https://github.com/iomonad/iomonad.el

(require 'package)

(setq package-user-dir  (expand-file-name (convert-standard-filename "packages") user-emacs-directory)
      package-enable-at-startup nil
      package-archives '(("melpa"        . "http://melpa.org/packages/")
						 ("gnu"          . "http://elpa.gnu.org/packages/")
						 ("marmalade"    . "http://marmalade-repo.org/packages/")
						 ("org" . "http://orgmode.org/elpa/")))

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(provide 'conf-repos)