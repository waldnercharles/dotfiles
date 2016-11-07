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

(use-package company
	:ensure t
	:init
	(global-company-mode)
	:config
	(add-to-list 'company-backends 'company-omnisharp))
	
(use-package csharp-mode
	:ensure t
	:init
	(add-hook 'csharp-mode-hook 'omnisharp-mode))

(use-package omnisharp
	:ensure t
	:init
	(setq omnisharp-curl-executable-path "/usr/bin/curl")
	(setq omnisharp-server-executable-path (expand-file-name "~/git/omnisharp-server/OmniSharp/bin/Release/OmniSharp.exe")))
	
