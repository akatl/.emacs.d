;; Straight.el config
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Font config
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(defun ce-set-font-faces ()
  (set-face-attribute 'default nil :font "Julia Mono-12")
  (set-face-attribute 'fixed-pitch nil :font "Julia Mono-12")
  (set-face-attribute 'variable-pitch nil :font "Iosevka-13")
  ;; emoji font
  (set-fontset-font t '(#x1f300 . #x1fad0)
		    (cond
		     ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
		     ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
		     ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
		     ((member "Symbola" (font-family-list)) "Symbola"))))

;; Load basic font when a frame is created. If emacs is running with --daemon
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (ce-set-font-faces))))
  (ce-set-font-faces))

(use-package org
      :ensure org-plus-contrib)  (set-face-attribute 'default nil :font "Julia Mono-13")

(org-babel-load-file "~/.emacs.d/config.org")

;; customizations made by emacs
(load custom-file)

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
