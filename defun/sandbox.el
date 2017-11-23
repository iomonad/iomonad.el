;; sanbox functions.

(require 'request)

(defun git-yolo ()
  "Retrieve message from 
	whatthe commit website
	and insert it in the buffer"
  (interactive)
  (let ((d "http://whatthecommit.com/index.txt"))
	(request d
			 :parser (lambda () (buffer-string))
			 :success (cl-function
					   (lambda (&key data &allow-other-keys)
						 (insert-string data))))))

(provide 'sandbox)
