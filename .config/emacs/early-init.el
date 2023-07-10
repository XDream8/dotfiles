;;; early-init
;;; Code:
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; disable built-in package manager
(setq package-enable-at-startup nil)

;; UI improvement
(setq default-frame-alist '((tool-bar-lines . 0)
			    (menu-bar-lines . 0)
			    (undecorated . t)
			    (vertical-scroll-bars . nil)
			    (horizontal-scroll-bars . nil)))

;; don’t blink cursor
(blink-cursor-mode -1)

(set-default-coding-systems 'utf-8)

;; no startup message
(setq inhibit-startup-message t)

(set-fringe-mode 10)

;; Set up the visible bell
(setq visible-bell t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; TAB cycle if there are only few candidates
(setq completion-cycle-threshold 3)

;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
;; Corfu commands are hidden, since they are not supposed to be used via M-x.
(setq read-extended-command-predicate
      #'command-completion-default-include-p)

;; Enable indentation+completion using the TAB key.
;; `completion-at-point' is often bound to M-TAB.
(setq tab-always-indent 'complete)

(provide 'early-init)
;;; early-init.el ends here
