(use-package all-the-icons-dired
  :ensure t
  :after all-the-icons
  :commands (deer ranger)
  :init
  (add-hook #'dired-mode-hook 'all-the-icons-dired-mode))

(provide 'init-all-the-icons-dired)
