;; settings

;; replace "yes" and "no" by "y" and "n"
(defalias 'yes-or-no-p 'y-or-n-p)
;; save desktop
(desktop-save-mode t)
;;display-time-mode
(setq display-time-24hr-format t
      display-time-default-load-average nil)
(display-time-mode t)
;;
(column-number-mode t)
(size-indication-mode t)
(blink-cursor-mode 0)
(diminish 'auto-revert-mode)

;; build-in modes
(use-package eldoc
    :diminish eldoc-mode)

(use-package electric-pair-mode
    :defer t
    :init
    (progn
      (electric-pair-mode t)))

(use-package display-line-numbers
    :defer 5
    :init
    (setq display-line-numbers-type 'visual)
    :config
    ;; (add-hook 'prog-mode-hook '(lambda () (display-line-numbers-mode 1))))
    (global-display-line-numbers-mode 1))
    ;; (add-hook 'prog-mode-hook #'global-display-line-numbers-mode))





;; key bindings

;; applications --------------------------------------------------------------
(my/leader-keys
 "au" 'undo-tree-visualize)
;; buffer --------------------------------------------------------------------
(my/leader-keys
 "bd" 'my/kill-this-buffer
 "bn" 'next-buffer
 "bp" 'previous-buffer
 "bx" 'kill-buffer-and-window
 )
;; file ----------------------------------------------------------------------
(my/leader-keys
 "fs" 'save-buffer)
;; frame
(my/leader-keys
 "Fd" 'delete-frame
 "Fn" 'make-frame
 "Fo" 'other-frame)
;; help ----------------------------------------------------------------------
(my/leader-keys
 "hdb" 'describe-bindings
 "hdc" 'describe-char
 "hdf" 'describe-function
 "hdk" 'describe-key
 "hdp" 'describe-package
 "hdt" 'describe-theme
 "hdv" 'describe-variable
 "hn"  'view-emacs-news
)
;; quit ---------------------------------------------------------------------
(my/leader-keys
 "qs" 'save-buffers-kill-emacs
 "qr" 'restart-emacs)
;; window -------------------------------------------------------------------
(my/leader-keys
 "wv" 'split-window-right
 "wV" 'split-window-right-and-focus
 "ws" 'split-window-below
 "wS" 'split-window-below-and-focus
 "w=" 'balance-windows-area
 "wm" 'my/toggle-maximize-buffer
 "wd" 'delete-window
 ;; winner-mode
 "wu" 'winner-undo
 "wU" 'winner-redo)
(provide 'init-defaults)