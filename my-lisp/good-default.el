;; 取消临时文件
(setq make-backup-files nil)

;; 中文字符环境
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(set-file-name-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-next-selection-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; 行号显示
(global-linum-mode 1)

;; 自动换行
(global-visual-line-mode t)

;; 禁用开始页面 文字模式
(setq initial-major-mode (quote text-mode))
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; 隐藏标题和菜单
(set-frame-parameter nil 'undecorated t) ; 标题
(menu-bar-mode 0) ; 菜单
(toggle-scroll-bar 0) ; 滚动条
(tool-bar-mode 0) ; 工具栏

;; 为了 lsp mode read-process-output-max
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;; 保存命令历史
(savehist-mode 1)

;; 高亮 pair
(show-paren-mode 1)
;; highlight brackets
(setq show-paren-style 'parenthesis)
;; highlight entire expression
(setq show-paren-style 'expression)
;; highlight brackets if visible, else entire expression
(setq show-paren-style 'mixed)



;; provide
(provide 'good-default)
