;; Abbreviation

(setq abbrev-file-name
      "~/.emacs.d/abbrevs.el")

(setq save-abbrevs t)

(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

(setq-default abbrev-mode t)

(provide 'conf-abbrev)
