  (use-package popwin
    :ensure t
    :config
    (progn
      (my/leader-keys
       "wpm" 'popwin:messages
       "wpp" 'popwin:close-popup-window)
      (popwin-mode 1)
      ;; don't use default value but manage it ourselves
      (setq popwin:special-display-config nil)

      ;; buffers that we manage
      (push '("*Help*"                 :dedicated t :position bottom :stick t :noselect nil   :height 0.4) popwin:special-display-config)
      (push '("*Process List*"         :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
      (push '("*compilation*"          :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config)
      (push '("*Shell Command Output*" :dedicated t :position bottom :stick t :noselect nil            ) popwin:special-display-config)
      (push '("*Async Shell Command*"  :dedicated t :position bottom :stick t :noselect nil            ) popwin:special-display-config)
      (push '(" *undo-tree*"           :dedicated t :position right  :stick t :noselect nil :width   60) popwin:special-display-config)
      (push '("*undo-tree Diff*"       :dedicated t :position bottom :stick t :noselect nil :height 0.3) popwin:special-display-config)
      (push '("*ert*"                  :dedicated t :position bottom :stick t :noselect nil            ) popwin:special-display-config)
      (push '("*grep*"                 :dedicated t :position bottom :stick t :noselect nil            ) popwin:special-display-config)
      (push '("*nosetests*"            :dedicated t :position bottom :stick t :noselect nil            ) popwin:special-display-config)
      (push '("^\*WoMan.+\*$" :regexp t             :position bottom                                   ) popwin:special-display-config)
      (push '("*Google Translate*"     :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config)
      (push '("*frequencies*"     :dedicated t :position bottom :stick t :noselect nil   :height 0.4) popwin:special-display-config)
      (push '("*Synonyms List*"     :dedicated t :position bottom :stick t :noselect nil   :height 0.4) popwin:special-display-config)
      (push '("*Ledger Report*"     :dedicated t :position right :stick t :noselect nil   :width 0.6) popwin:special-display-config)
      (push '("\*Outline.*\*"     :regexp t :dedicated t :position right :stick t :noselect nil   :width 0.3) popwin:special-display-config)
      (push '("*PDF-Occur*"     :dedicated t :position right :stick t :noselect nil   :width 0.4) popwin:special-display-config)
      (push '("*WordNut*"     :dedicated t :position right :stick t :noselect nil   :width 0.5) popwin:special-display-config)
      (push '("*Synonyms List*"     :dedicated t :position bottom :stick t :noselect nil   :height 0.4) popwin:special-display-config)
      (push '("*Calendar*"     :dedicated t :position bottom :stick t :noselect nil   :height 0.4) popwin:special-display-config)
      (push '("*Youdao Dictionary*"     :dedicated t :position bottom :stick t :noselect nil   :height 0.25) popwin:special-display-config)
      (push '("*Anaconda*"     :dedicated t :position bottom :stick t :noselect nil   :height 0.25) popwin:special-display-config)
      (push '(flycheck-error-list-mode     :dedicated t :position bottom :stick t :noselect nil   :height 0.25) popwin:special-display-config)
      (push '("*Compile-Log*"     :dedicated t :position bottom :stick t :noselect nil   :height 0.25) popwin:special-display-config)
      ))
(provide 'init-popwin)
