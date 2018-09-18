(use-package avy
    :ensure t
    :defer t
    :init
    (progn
      (setq avy-all-windows 'nil
            avy-background t)
      (my/leader-keys
       "jj" 'evil-avy-goto-char-timer
       "jl" 'evil-avy-goto-line
       "jw" 'evil-avy-goto-word-or-subword-1
       "jc" 'evil-avy-goto-char-2)))
(provide 'init-avy)