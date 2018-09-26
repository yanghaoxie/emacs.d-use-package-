(setq-default mode-line-format
              (list
               ;;eyebrowse
               '(:eval (eyebrowse-mode-line-indicator))
              ;; winum
               "["
               '(:eval (winum-get-number-string))
               "]"
               " "
               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize "%b" 'face nil
                                   'help-echo (buffer-file-name)))

               ;; '(:eval mode-line-frame-identification)
               '(:eval mode-line-modified)
               " "
               '(:eval mode-line-percent-position)
               ;; '(:eval mode-line-position)

               ;; line and column
               "(" ;; '%02' to set to 2 chars at least; prevents flickering
               "%02l" "," "%02c"
               ;; (propertize "%02l" 'face 'font-lock-type-face) ","
               ;; (propertize "%02c" 'face 'font-lock-type-face)
               ") "

               ;; the current major mode for the buffer.
               "["

               '(:eval (propertize "%m" 'face nil
                                   'help-echo buffer-file-coding-system))
               ;; " "


               ;; insert vs overwrite mode, input-method in a tooltip
               ';; (:eval (propertize (if overwrite-mode "Ovr" "Ins")
               ;;          'face nil
               ;;          'help-echo (concat "Buffer is in "
               ;;                       (if overwrite-mode "overwrite" "insert") " mode")))

               ;; was this buffer modified since the last save?
               '(:eval (when (buffer-modified-p)
                         (concat ","  (propertize "Mod"
                                                  'face nil
                                                  'help-echo "Buffer has been modified"))))


               ;; is this buffer read-only?
               '(:eval (when buffer-read-only
                         (concat ","  (propertize "RO"
                                                  'face nil
                                                  'help-echo "Buffer is read-only"))))
               "] "
               '(:eval vc-mode vc-mode)
               '(:eval evil-mode-line-tag)

               ;;global-mode-string, org-timer-set-timer in org-mode need this
               (propertize "%M" 'face nil)

               ;; " --"
               ;; i don't want to see minor-modes; but if you want, uncomment this:
               ;; minor-mode-alist  ;; list of minor modes
               ;; "%-" ;; fill with '-'
               ))
(provide 'init-modeline)