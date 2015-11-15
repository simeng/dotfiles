; Setup package manager (M-x list-packages)
(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
    package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
    package-archives)
(package-initialize)

; Setup evil mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; Use evil mode by default in all modes
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

; Space indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

; Powerline alternative for emacs
(require 'powerline)
(require 'powerline-evil)
(powerline-evil-vim-color-theme)

; Nice theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'seti t)

; PHP major mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-hook 'php-mode-hook
    '(lambda ()
       (auto-complete-mode t)
       (require 'ac-php)
       ;;(setq ac-php-use-cscope-flag  t ) ;;enable cscope
       (setq ac-sources  '(ac-source-php ) )
       (yas-global-mode 1)
       (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
       (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
    ))

; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl?\\'" . web-mode))


