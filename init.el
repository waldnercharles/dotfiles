(setq user-full-name "Charles Waldner")
(setq	user-mail-address "waldner.charles@gmail.com")

(require 'cl-lib)
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil-leader
	:config
	(global-evil-leader-mode)
	(setq evil-leader/in-all-states t))

(use-package evil)

(use-package company
	:ensure t
	:config
	(global-company-mode)
	(add-to-list 'company-backends 'company-omnisharp))
	
(use-package csharp-mode
	:ensure t
	:config
	(add-hook 'csharp-mode-hook 'omnisharp-mode))

(use-package omnisharp
	:ensure t
	:config
	(setq omnisharp-curl-executable-path "/usr/bin/curl")
	(setq omnisharp-server-executable-path (expand-file-name "~/git/omnisharp-server/OmniSharp/bin/Release/OmniSharp.exe")))
	
