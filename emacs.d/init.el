;; Load config form org file for Emacs 24

;; Personal info
(setq user-full-name "Denis Samuylov")
(setq user-email-address "denis.samuylov@gmail.com")

;; This setup does not work with emacs below version 24.1
(when (version< emacs-version "24.1")
  (error "Requires at least GNU Emacs 24.1"))

;; Initialize cask
(defvar cask-dir "$HOME/.cask/cask.el"
  "Cask root directory.")

(require 'cask cask-dir)
(cask-initialize)

;; ob-tangle for a literate .emacs
(require 'ob-tangle)
(org-babel-load-file
 (expand-file-name "init-literate.org" user-emacs-directory))
