;;Remove welcome
(setq inhibit-startup-message t)

;;Remove menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Remove scroll
(scroll-bar-mode -1)

;;show line numbers
(global-display-line-numbers-mode t)

;;maximize window
(add-hook 'window-setup-hook 'toggle-frame-maximized)

;; font size
(set-face-attribute 'default nil :height 120)

;;set tabsize
(setq c-default-style "linux"
      c-basic-offset 4)

;;shortcuts
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
		
;;packages
(require 'package)
(setq package-enable-at-startup nil)


					;MELPA repo

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

;; themes
(use-package darcula-theme
  :ensure t
  )

(use-package flatland-theme
  :ensure t
  )

(use-package heroku-theme
  :ensure t
  )

(use-package moe-theme
  :ensure t
  )

(use-package monokai-theme
  :ensure t
  )

(use-package spacemacs-theme
  :ensure t
  )

(use-package github-theme
  :ensure t
  )

(use-package vscode-dark-plus-theme
  :ensure t
  ;; your preferred main font face here
  ;;(set-frame-font "Inconsolata-14")
)

(load-theme 'darcula t)

(use-package magit
  :ensure t)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode)
  )
  )
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    )
)

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  ;;:config
  ;;(progn
;;	 (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;;)
  :bind (("C-\\" . 'neotree-toggle))
  )

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window))
  )


(use-package projectile
  :ensure t
  )

(projectile-mode +1)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;; SET FOR C++ DEVELOPMENT
(use-package lsp-mode :commands lsp :ensure t)
(use-package lsp-ui :commands lsp-ui-mode :ensure t)

(use-package dashboard
  :ensure t
  :config
  (use-package dashboard-project-status
   :ensure t 
   :config
    (add-to-list 'dashboard-item-generators
                 `(project-status . ,(dashboard-project-status "/home/fabricio")))
    (add-to-list 'dashboard-items '(project-status) t)
    (setq dashboard-items '((project-status . 10)
                            (recents        . 10)
                            (agenda         . 10))))
  (dashboard-setup-startup-hook))

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(global-set-key (kbd "C-x a g") 'helm-do-grep-ag)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

;; (use-package ccls
;;   :ensure t
;;   :config
;;   (setq ccls-executable "ccls")
;;   (setq lsp-prefer-flymake nil)
;;   ;;(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
;;   :hook ((c-mode c++-mode objc-mode) .
;;          (lambda () (require 'ccls) (lsp))))

(use-package helm-ag
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("60c23c3a831c9f28b10084e8642b7d987d33be3faee8f68d68d1cf6b171041da" "993aac313027a1d6e70d45b98e121492c1b00a0daa5a8629788ed7d523fe62c1" "3f1dcd824a683e0ab194b3a1daac18a923eed4dba5269eecb050c718ab4d5a26" default))
 '(package-selected-packages '(helm-ag ccls magit darcula-theme ace-window neotree try)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
