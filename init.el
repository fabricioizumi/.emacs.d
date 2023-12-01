;;Remove welcome
(setq inhibit-startup-message t)

;;Remove menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Remove scroll
(scroll-bar-mode -1)

;;show line numbers
(global-display-line-numbers-mode t)


;; font size
(set-face-attribute 'default nil :height 100)

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

(load-theme 'heroku t)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("60c23c3a831c9f28b10084e8642b7d987d33be3faee8f68d68d1cf6b171041da" "993aac313027a1d6e70d45b98e121492c1b00a0daa5a8629788ed7d523fe62c1" "3f1dcd824a683e0ab194b3a1daac18a923eed4dba5269eecb050c718ab4d5a26" default))
 '(package-selected-packages '(magit darcula-theme ace-window neotree try)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
