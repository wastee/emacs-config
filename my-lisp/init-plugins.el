;; All packages use the use-package mode
(require 'use-package)
(require 'tee-functions)

;; Enable Evil
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; Enable Evil comment
(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

;; Enable Evil Leader Key
(use-package evil-leader
  :init
  (global-evil-leader-mode)
  :config
  (progn
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "a" 'mark-whole-buffer
      "f" 'counsel-find-file
      "r" 'recentf-open-files
      "b" 'switch-to-buffer
      "k" 'kill-buffer
      ;;"d" 'evil-delete-char
      "qq" 'save-buffers-kill-terminal)

  )
)

;; Enable fcitx remote
(use-package fcitx
  :ensure t
  :init
  (setq fcitx-remote-command "fcitx5-remote")
  (setq fcitx5-use-dbus t)
  :config
  (fcitx-aggressive-setup))

;; Enable markdown mode
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; Enable cnfonts
(use-package cnfonts
  :ensure t
  :init
  (cnfonts-enable)
  :config
  (global-set-key (kbd "<C-mouse-4>") 'cnfonts-increase-fontsize)
  (global-set-key (kbd "<C-mouse-5>") 'cnfonts-decrease-fontsize)
)

;; Enable auto-save
(use-package auto-save
  :config
  (auto-save-enable)
  :init
   (setq auto-save-silent t)   ; quietly save
   (setq auto-save-delete-trailing-whitespace t))  ; automatically delete spaces at the end of the line when saving

;; Enable auto-save
(use-package solarized-theme
  :ensure t
  :init
  (load-theme 'solarized-wombat-dark t))

;; Enable awesome-pair
(use-package awesome-pair
  :config
  (dolist (hook (list
               'c-mode-common-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook 'lisp-mode-hook
               'maxima-mode-hook
               'ielm-mode-hook
               'sh-mode-hook
               'makefile-gmake-mode-hook
               'php-mode-hook
               'python-mode-hook
               'js-mode-hook
               'go-mode-hook
               'qml-mode-hook
               'jade-mode-hook
               'css-mode-hook
               'ruby-mode-hook
               'coffee-mode-hook
               'rust-mode-hook
               'qmake-mode-hook
               'lua-mode-hook
               'swift-mode-hook
               'minibuffer-inactive-mode-hook
               ))
    (add-hook hook '(lambda () (awesome-pair-mode 1)))
  )
  (define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
  (define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
  (define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
  (define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
  (define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
  (define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)
  (define-key awesome-pair-mode-map (kbd "=") 'awesome-pair-equal)

  (define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)
  (define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)

  (define-key awesome-pair-mode-map (kbd "SPC") 'awesome-pair-space)

  (define-key awesome-pair-mode-map (kbd "M-o") 'awesome-pair-backward-delete)
  (define-key awesome-pair-mode-map (kbd "C-d") 'awesome-pair-forward-delete)
  (define-key awesome-pair-mode-map (kbd "C-k") 'awesome-pair-kill)

  (define-key awesome-pair-mode-map (kbd "M-\"") 'awesome-pair-wrap-double-quote)
  (define-key awesome-pair-mode-map (kbd "M-[") 'awesome-pair-wrap-bracket)
  (define-key awesome-pair-mode-map (kbd "M-{") 'awesome-pair-wrap-curly)
  (define-key awesome-pair-mode-map (kbd "M-(") 'awesome-pair-wrap-round)
  (define-key awesome-pair-mode-map (kbd "M-)") 'awesome-pair-unwrap)

  (define-key awesome-pair-mode-map (kbd "M-p") 'awesome-pair-jump-right)
  (define-key awesome-pair-mode-map (kbd "M-n") 'awesome-pair-jump-left)
  (define-key awesome-pair-mode-map (kbd "M-:") 'awesome-pair-jump-out-pair-and-newline)
)

;; Enable ivy counsel swiper
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :config
  (setq ivy-initial-inputs-alist nil) ; hide input char at start
)

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "\C-s") 'counsel-grep-or-swiper)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
)

(use-package swiper
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
)

;; Enable ivy sort by prescient
(use-package ivy-prescient
  :ensure t
  :config
  (ivy-prescient-mode 1)
  )

;; Enable drag lines
(use-package drag-stuff
  :ensure t
  :init
  (drag-stuff-global-mode 1)
  :config
  (drag-stuff-define-keys)
)

;; Enable python-mode
(use-package python-mode
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (setq indent-tabs-mode nil)
  (setq python-indent-offset 4)
  )

;; Enable lsp-mode
(use-package lsp-mode
  :ensure t
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
          (python-mode . lsp)
          ;; if you want which-key integration
          (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :init
  (setq lsp-keymap-prefix "s-k")
  )
;; optionally
(use-package lsp-ui :ensure :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy :ensure :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :ensure t
    :config
    (which-key-mode))

;; Enable company-mode
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.0)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers nil)


  (push 'company-capf company-backends)
  )

;; Enable company-lsp
(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  )

;; Enable lsp pyright
;; (use-package lsp-pyright
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp))))  ; or lsp-deferred

;; Enable flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :diminish flycheck-mode)

;; Enable ccls
(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

;; Enable eshell-toggle
(use-package eshell-toggle
  :ensure t
  :custom
  (eshell-toggle-size-fraction 3)
  (eshell-toggle-default-directory "/home/tee/")
  (eshell-toggle-use-projectile-root t)
  (eshell-toggle-run-command nil)
  (eshell-toggle-init-function #'eshell-toggle-init-ansi-term)
  :bind
  ("C-`" . eshell-toggle))

;; Enable projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map))

;; provide
(provide 'init-plugins)
