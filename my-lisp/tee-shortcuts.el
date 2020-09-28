;; 最近打开的文件
(require 'tee-functions)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; insert-mode 里 C-v 粘贴
(define-key evil-insert-state-map "\C-v" 'yank)
(define-key evil-insert-state-map "\C-a" 'mark-whole-buffer)


;; provide
(provide 'tee-shortcuts)
