;;;###autoload
(defun my/kill-this-buffer (&optional arg)
  ;; copy from spacemacs
  "Kill the current buffer.
If the universal prefix argument is used then kill also the window."
  (interactive "P")
  (if (window-minibuffer-p)
      (abort-recursive-edit)
    (if (equal '(4) arg)
        (kill-buffer-and-window)
      (kill-buffer))))

;;;###autoload
;; from https://gist.github.com/3402786
(defun my/toggle-maximize-buffer ()
  "Maximize buffer"
  (interactive)
  (if (and (= 1 (length (window-list)))
           (assoc ?_ register-alist))
      (jump-to-register ?_)
    (progn
      (window-configuration-to-register ?_)
      (delete-other-windows))))

;;;###autoload
(defun my/toggle-syntax-checking ()
  (interactive)
  (if (bound-and-true-p flycheck-mode)
      (progn
	(flycheck-mode -1)
	(message "Flycheck mode disabled in current buffer"))
    (progn
      (flycheck-mode 1)
      (message "Flycheck mode enabled in current buffer"))))

;;;###autoload
(defun my/byte-compile-init-dir ()
  "Byte-compile all your dotfiles."
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))

;; copy from spacemacs
;;;###autoload
(defun my/alternate-buffer (&optional window)
  "Switch back and forth between current and last buffer in the
current window."
  (interactive)
  (let ((current-buffer (window-buffer window)))
    ;; if no window is found in the windows history, `switch-to-buffer' will
    ;; default to calling `other-buffer'.
    (switch-to-buffer
     (cl-find-if (lambda (buffer)
                   (not (eq buffer current-buffer)))
                 (mapcar #'car (window-prev-buffers window))))))

;;;###autoload
(defun my/org-ref-open-pdf-at-point ( )
  "Open the pdf for bibtex key under point if it exists."
  (interactive)
  (let* ((results (org-ref-get-bibtex-key-and-file))
         (key (car results))
         (pdf-file (car (bibtex-completion-find-pdf key))))
    (if (file-exists-p pdf-file)
        (org-open-file pdf-file)
      (message "No PDF found for %s" key))))

;; restart emacs with --debut-init, copy from spacemacs
;;;###autoload
(defun my/restart-emacs-debug-init (&optional args)
  "Restart emacs and enable debug-init."
  (interactive)
  (restart-emacs (cons "--debug-init" args)))

;;;###autoload
(defun my/toggle-next-theme (theme1 theme2)
  (if (-contains? custom-enabled-themes theme1)
      (progn
	(disable-theme theme1)
	(load-theme theme2 t))
    (progn
      (disable-theme theme2)
      (load-theme theme1 t))))

;;;###autoload
(defun my/toggle-highlight-symbol ()
  (interactive)
  (if (bound-and-true-p highlight-symbol-mode)
      (progn
	(highlight-symbol-mode -1)
	(hl-line-mode 1)
	(message "Highlight symbol mode disabled and hl-line-mode enabled in current buffer"))
    (progn
      (highlight-symbol-mode 1)
      (hl-line-mode -1)
      (message "Highlight symbol mode enabled and hl-line-mode disabled in current buffer"))))

;;;###autoload
(defun my/toggle-flyspell()
  (interactive)
  (if (bound-and-true-p flyspell-mode)
      (flyspell-mode -1)
    (flyspell-mode 1)))
(defun my/toggle-flyspell ()
  (interactive)
  (if (bound-and-true-p flyspell-mode)
      (progn
	(flyspell-mode -1)
	(message "Flyspell mode disabled in current buffer"))
    (progn
      (flyspell-mode 1)
      (message "Flyspell mode enabled in current buffer"))))
;;;###autoload
(defun my/toggle-color-identifiers ()
  (interactive)
  (if (bound-and-true-p color-identifiers-mode)
      (progn
	(color-identifiers-mode -1)
	(message "Color identifiers mode disabled in current buffer"))
    (progn
      (color-identifiers-mode 1)
      (message "Color identifiers mode enabled in current buffer"))))

;;;###autoload
(defun my/show-current-time ()
  ;; show current time in minibuffer
  (interactive)
  (message (current-time-string)))

;;;###autoload
(defun my/copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(provide 'init-autoload)
