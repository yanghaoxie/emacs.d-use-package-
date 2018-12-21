(use-package smartparens
  :ensure t
  :defer t
  :diminish smartparens-mode
  :init
  (progn
    (smartparens-global-mode t)
    (smartparens-global-strict-mode t))
  :config
  ;; smartparens #431 workaround for fixing conflict between smarparens and yasnippet
  (add-hook 'yas-before-expand-snippet-hook (lambda () (smartparens-mode -1)))
  (add-hook 'yas-after-exit-snippet-hook (lambda () (smartparens-mode 1)))
  (my/leader-keys
    "k{" 'sp-wrap-curly
    "k(" 'sp-wrap-round
    "k[" 'sp-wrap-square
    "ku" 'sp-unwrap-sexp
    "kr" 'sp-rewrap-sexp
    "tp" 'my/toggle-smartparens)
  (my/all-states-keys
    :prefix "M-s"
    ;; navigation
    "f" 'sp-forward-sexp
    "b" 'sp-backward-sexp
    "d" 'sp-down-sexp
    "M-d" 'sp-backward-down-sexp
    "u" 'sp-up-sexp
    "M-u" 'sp-backward-up-sexp
    "n" 'sp-next-sexp
    "p" 'sp-previous-sexp
    "a" 'sp-beginning-of-sexp
    "e" 'sp-end-of-sexp
    ;; slurp and barf
    "l" 'sp-forward-slurp-sexp
    "h" 'sp-backward-slurp-sexp
    "M-l" 'sp-forward-barf-sexp
    "M-h" 'sp-backward-barf-sexp
    ;; killing
    "k" 'sp-kill-sexp
    "M-k" 'sp-backward-kill-sexp)
  (defun my/toggle-smartparens ()
    (interactive)
    (if (bound-and-true-p smartparens-mode)
	(progn
	  (smartparens-mode -1)
	  (smartparens-strict-mode -1)
	  (evil-smartparens-mode -1)
	  (message "Smartparens mode disabled in current buffer"))
      (progn
	(smartparens-mode 1)
	(smartparens-strict-mode 1)
	(evil-smartparens-mode 1)
	(message "Smartparens mode enabled in current buffer")))))

(use-package evil-smartparens
  :ensure t
  :defer t
  :diminish evil-smartparens-mode
  :init
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))
(provide 'init-smartparens)
