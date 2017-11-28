;; file iomonad.el

(defun google ()
  (interactive)
  (browse-url
   (concat
    "http://www.google.nl/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))


(provide 'iomonad)
