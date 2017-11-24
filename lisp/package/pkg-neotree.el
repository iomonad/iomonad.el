;; -*- lexical-binding: t -*-
(use-package neotree
  :ensure t)

(use-package all-the-icons
  :ensure t)

(setq neo-theme
      (if (display-graphic-p) 'icons 'arrow))

(custom-set-faces
 '(neo-dir-link-face ((t (:foreground "white"))))
 '(neo-file-link-face ((t (:foreground "white")))))

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)


(provide 'pkg-neotree)
