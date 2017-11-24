(eval-when-compile (require 'cl))

(defgroup mode-line-color nil
  "Mode line color."
  :prefix "mode-line-color-"
  :group 'mode-line)

(defcustom mode-line-color-buffers-regexp '("^\\*scratch\\*$")
  "List of regular expressions of buffer names to enable mode-line-color-mode automatically."
  :group 'mode-line-color
  :type '(repeat 'string))

(defcustom mode-line-color-exclude-buffers-regexp '("^ ")
  "List of regular expressions of buffer names not to enable mode-line-color-mode automatically."
  :group 'mode-line-color
  :type '(repeat 'string))

(defvar mode-line-color-hook nil
  "hook for setting mode line color

   Usage:
     (defun your-function-to-set-mode-line-color (setter)
       (funcall setter \"yellow\"))
     (add-hook 'mode-line-color-hook 'your-function-to-set-mode-line-color)")

(defvar mode-line-color-mode nil)
(defvar mode-line-color-color nil)
(defvar mode-line-color-original nil)
(defvar mode-line-color-activated nil)
(make-variable-buffer-local 'mode-line-color-activated)

(defun mode-line-color-set-color (color)
  (setq mode-line-color-color color))

(defun mode-line-color-excluded-p ()
  (let* ((buffer (current-buffer)) (name (buffer-name buffer)))
    (flet ((mem-pat (s l)
             (memq nil (mapcar #'(lambda (r) (not (string-match-p r s))) l))))
      (or (minibufferp buffer)
          (and (not (mem-pat name mode-line-color-buffers-regexp))
               (mem-pat name mode-line-color-exclude-buffers-regexp))))))

(defun mode-line-color-active-p ()
  (unless mode-line-color-activated ; make cache
    (let ((exclude (mode-line-color-excluded-p)))
      (setq mode-line-color-activated (if exclude 0 1))))
  (= 1 mode-line-color-activated))

(defun mode-line-color-update (&optional force)
  (if (mode-line-color-active-p)
      (let ((mode-line-color-color nil))
        (run-hook-with-args 'mode-line-color-hook 'mode-line-color-set-color)
        (set-face-background 'mode-line-evil (or mode-line-color-color
                                            mode-line-color-original)))
    (unless (minibufferp)
      (set-face-background 'mode-line-evil mode-line-color-original))))

(defmacro define-mode-line-color (bind &rest body)
  (declare (indent defun))
  (let ((prev (nth 0 bind)))
    `(add-hook 'mode-line-color-hook
               #'(lambda (setter)
                   (let* ((,prev mode-line-color-color) (color (progn ,@body)))
                     (when color (funcall setter color)))))))

(defun mode-line-color-install ()
  (unless mode-line-color-original
    (setq mode-line-color-original (face-background 'mode-line-evil)))
  (add-hook 'post-command-hook 'mode-line-color-update))

(defun mode-line-color-uninstall ()
  (set-face-background 'mode-line-evil mode-line-color-original)
  (remove-hook 'post-command-hook 'mode-line-color-update))

(defadvice set-buffer (after update-mode-line-color activate)
  (when (eq (current-buffer) (window-buffer (selected-window)))
    (mode-line-color-update)))

(defadvice kill-buffer (after update-mode-line-color activate)
  (mode-line-color-update))

;;;###autoload
(define-minor-mode mode-line-color-mode
  "Set color of mode line."
  :global t
  :group 'mode-line-color
  (if mode-line-color-mode
      (mode-line-color-install)
    (mode-line-color-uninstall)))

(provide 'mode-line-color)
