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

; Disable bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; Put us straght into empty buffer
(setq inhibit-splash-screen t
    initial-scratch-message nil
    initial-major-mode 'org-mode)

; Disable backupfiles
(setq make-backup-files nil)

; Replace yes and no with y and n
(defalias 'yes-or-no-p 'y-or-n-p)

; Fix bell sounds and faster keystrokes
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

; Fix ctrl-u in insert mode (seems broken by evil mode)
(define-key evil-insert-state-map (kbd "C-u") 'kill-whole-line)
