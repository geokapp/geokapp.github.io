;;---------------------------------------------------------------------------------
;; Emacs Configuration file
;;---------------------------------------------------------------------------------

;;---------------------------------------------------------------------------------
;; General Settings
;;---------------------------------------------------------------------------------

;;
;; Use Solarized Emacs Theme
;;
(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(if
    (equal 0 (string-match "^24" emacs-version))
    ;; it's emacs24, so use built-in theme 
    (require 'solarized-dark-theme)
  ;; it's NOT emacs24, so use color-theme
  (progn
    (require 'color-theme)
    (color-theme-initialize)
    (require 'color-theme-solarized)
    (color-theme-solarized-dark)))


;;
;; Use C-c C-z to invoke an eshell inside emacs
;;
(global-set-key "\C-c\C-z" 'eshell)

;;
;; Change mini-buffer color
;;
(set-face-foreground 'minibuffer-prompt "yellow")

;;
;; Display line numbers
;;
(setq linum-format "%6d  ")
(global-linum-mode t)

;;
;; mouse scrolling
;;
(mouse-wheel-mode t)

;;
;; enable interactive man pages
;;
(global-set-key [(f1)] (lambda () (interactive) (manual-entry (current-word))))

;;
;; Automatic Indentation
;;
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))


(setq c-default-style "linux")

;;---------------------------------------------------------------------------------
;; Makefiles
;;---------------------------------------------------------------------------------

;;
;; Accept more filenames as Makefiles.
;;
(setq auto-mode-alist (cons '(".*Makefile.*" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mak" . makefile-mode) auto-mode-alist))

;;---------------------------------------------------------------------------------
;; Latex 
;;---------------------------------------------------------------------------------

;; 
;; spellcheck in LaTex mode
;;
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'tex-mode-hook 'flyspell-mode)
(add-hook 'bibtex-mode-hook 'flyspell-mode)

;;
;; Math mode for LaTex
;;
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;;
;; Enable AUCTEX macros
;;
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)

;;---------------------------------------------------------------------------------
