(require 'erc)
(require 'erc-log)
(require 'erc-notify)
(require 'erc-spelling)
(require 'erc-autoaway)
(require 'conf-userinfos)

(setq erc-log-channels-directory
      (concat user-emacs-directory  ".erc/logs/"))

(setq erc-save-buffer-on-part t)
(setq erc-log-insert-log-on-open t)
(setq erc-kill-buffer-on-part t)
(setq erc-interpret-mirc-color t)

(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
(if (not (file-exists-p erc-log-channels-directory))
    (mkdir erc-log-channels-directory t))

(setq erc-save-buffer-on-part t)
(defadvice save-buffers-kill-emacs (before save-logs (arg) activate)
  (save-some-buffers t (lambda () (when (eq major-mode 'erc-mode) t))))

(erc-truncate-mode +1)

(setq erc-nick "trosa-work")
(setq erc-keywords '("trosa-work" "trosa"))
(setq erc-user-full-name *user-name*)

(setq erc-auto-discard-away t)
(setq erc-autoaway-idle-seconds 600)
(setq erc-autoaway-use-emacs-idle t)

(setq erc-server-coding-system '(utf-8 . utf-8))

(setq erc-autojoin-channels-alist '(("freenode.net"
                                     "#emacs" "#clojure" "#lisp"
                                     "#haskell" "#archlinux" "#gentoo")
				    ("rizon.net" "#code")))
;; (defun launch-irc ()
;;   "Launch irc")
(erc-log-mode) 
(setq erc-generate-log-file-name-function (quote erc-generate-log-file-name-with-date))
(setq erc-save-buffer-on-part nil)
(setq erc-save-queries-on-quit nil)
(setq erc-log-write-after-insert t)
(setq erc-log-write-after-send t)

(provide 'conf-erc)
