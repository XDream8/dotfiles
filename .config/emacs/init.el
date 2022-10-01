(require 'package)

(defmacro append-to-list (target suffix)
  "Append SUFFIX to TARGET in place."
  `(setq ,target (append ,target ,suffix)))

(append-to-list package-archives
                '(("melpa" . "http://melpa.org/packages/") ;; Main package archive
                  ("melpa-stable" . "http://stable.melpa.org/packages/") ;; Some packages might only do stable releases?
                  ("org-elpa" . "https://orgmode.org/elpa/"))) ;; Org packages, I don't use org but seems like a harmless default

(package-initialize)

;; Ensure use-package is present. From here on out, all packages are loaded
;; with use-package. Also, refresh the package archive on load so we can pull the latest packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; Allow navigation between use-package stanzas with imenu.
;; This has to be set before loading use-package.
(defvar use-package-enable-imenu-support t)
(require 'use-package)
(setq
 use-package-always-ensure t ;; Makes sure to download new packages if they aren't already downloaded
 use-package-verbose t) ;; Package install logging. Packages break, nice to know why.

;; Any Customize-based settings should live in custom.el, not here.
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror)

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(set-default-coding-systems 'utf-8)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)

;; Set up the visible bell
(setq visible-bell t)

(defalias 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode t)              ; Always highlight the current line.
(show-paren-mode t)                  ; And point out matching parentheses.
(delete-selection-mode t)            ; Behave like any other sensible text editor would.
(save-place-mode)                    ; Remember where I was

;; line numbers
(global-display-line-numbers-mode t)

(setq
  compilation-always-kill t              ; Never prompt to kill a compilation session.
  compilation-scroll-output 'first-error ; Always scroll to the bottom.
  make-backup-files nil                  ; No backups, thanks.
  auto-save-default nil                  ; Or autosaves. What's the difference between autosaves and backups?
  create-lockfiles nil                   ; Emacs sure loves to put lockfiles everywhere.
  inhibit-startup-screen t               ; No need to see GNU agitprop.
  kill-whole-line t                      ; Lets C-k delete the whole line
  mac-command-modifier 'super            ; I'm not sure this is the right toggle, but whatever.
  require-final-newline t                ; Auto-insert trailing newlines.
  ring-bell-function 'ignore             ; Do not ding. Ever.
  use-dialog-box nil                     ; Dialogues always go in the modeline.
  frame-title-format "emacs – %b"        ; Put something useful in the status bar.
  initial-scratch-message nil            ; SHUT UP SHUT UP SHUT UP
  mac-option-modifier 'meta              ; why isn't this the default
  save-interprogram-paste-before-kill t  ; preserve paste to system ring
  enable-recursive-minibuffers t         ; don't fucking freak out if I use the minibuffer twice
  sentence-end-double-space nil          ; are you fucking kidding me with this shit
  confirm-kill-processes nil             ; don't whine at me when I'm quitting.
  mac-mouse-wheel-smooth-scroll nil      ; no smooth scrolling
  mac-drawing-use-gcd t                  ; and you can do it on other frames
  mark-even-if-inactive nil              ; prevent really unintuitive undo behavior
  )

;; set the font
(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono" :height 110)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(setq x-super-keysym 'meta)
;; Fullscreen by default, as early as possible. This tiny window is not enough
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq use-dialog-box nil) ;; Disable dialog boxes since they weren't working in Mac OSX

;; Don't warn for large files
(setq large-file-warning-threshold nil)

(setq display-time-world-list
  '(("Etc/UTC" "UTC")
    ("America/Los_Angeles" "Seattle")
    ("America/New_York" "New York")
    ("Europe/Istanbul" "Turkey")
    ("Pacific/Auckland" "Auckland")
    ("Asia/Shanghai" "Shanghai")))
(setq display-time-world-time-format "%a, %d %b %I:%M %p %Z")

;;; Editing settings
(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)

(setq-default indent-tabs-mode nil)

;; Automatically comment lines
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; The Doom Emacs themes look really good.
(use-package doom-themes
  :config
  (load-theme 'doom-molokai)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package emojify
  :commands emojify-mode
  :config (global-emojify-mode))

(use-package paren
  :config
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))

(use-package smartparens
  :hook (prog-mode . smartparens-mode))

(use-package default-text-scale
  :defer 1
  :config
  (default-text-scale-mode))

;; Folding
(use-package origami
  :hook (yaml-mode . origami-mode))

;; Automatically clean whitespace
(use-package ws-butler
  :hook ((text-mode . ws-butler-mode)
         (prog-mode . ws-butler-mode)))

(use-package diminish)

;; Make M-x and other mini-buffers sortable, filterable
(use-package ivy
  :diminish
  :init
  (ivy-mode 1)
  (unbind-key "S-SPC" ivy-minibuffer-map)
  (setq ivy-height 15
        ivy-use-virtual-buffers t
        ivy-use-selectable-prompt t))

(use-package counsel
  :after ivy
  :init
  (counsel-mode 1)
  :bind (:map ivy-minibuffer-map))

;; Company is the best Emacs completion system.
(use-package company
  :bind (("C-." . company-complete))
  :custom
  (company-idle-delay 0) ;; I always want completion, give it to me asap
  (company-dabbrev-downcase nil "Don't downcase returned candidates.")
  (company-show-numbers t "Numbers are helpful.")
  (company-tooltip-limit 10 "The more the merrier.")
  :config
  (global-company-mode) ;; We want completion everywhere

  ;; use numbers 0-9 to select company completion candidates
  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x)
                        `(lambda () (interactive) (company-complete-number ,x))))
          (number-sequence 0 9))))

;; Flycheck is the newer version of flymake and is needed to make lsp-mode not freak out.
(use-package flycheck
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode) ;; always lint my code
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; Package for interacting with language servers
(use-package lsp-mode
  :commands lsp
  :hook ((typescript-mode js2-mode web-mode) . lsp)
  :bind (:map lsp-mode-map
         ("TAB" . completion-at-point))
  :config
  (setq lsp-prefer-flymake nil ;; Flymake is outdated
        lsp-headerline-breadcrumb-mode nil)) ;; I don't like the symbols on the header a-la-vscode, remove this if you like them.

;; Basic python configuration
(use-package python
  :init
  (require 'python)
  :config
  ;; As soon as we detect python go look for that virtual env.
  (add-hook 'python-mode-hook #'auto-virtualenv-set-virtualenv))

;; Pyenv is the only reasonable way to manage python installs. What a mess.
(use-package pyvenv
  :after python)

;; Auto detect my virtual env, please
(use-package auto-virtualenv)

;; Use the microsoft-python language server, it's the best available as of writing this
(use-package lsp-python-ms
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

(use-package yasnippet
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all))

;; We need something to manage the various projects we work on
;; and for common functionality like project-wide searching, fuzzy file finding etc.
(use-package projectile
  :init
  (projectile-mode t) ;; Enable this immediately
  :config
  (setq projectile-enable-caching t ;; Much better performance on large projects
        projectile-completion-system 'ivy)) ;; Ideally the minibuffer should aways look similar

;; Counsel and projectile should work together.
(use-package counsel-projectile
  :init
  (counsel-projectile-mode))

;; This is the best git client ever.
;; I know some people who only use emacs for magit (i.e dev in IntelliJ and commit/rebase/diff in emacs)
;; it's that good.
(use-package magit
  :config
  (magit-auto-revert-mode t) ;; Buffers will reload automatically if for example you hard-reset/revert changes in magit
  (setq magit-completing-read-function 'ivy-completing-read)) ;; Everything should work with Ivy

;; Begin improvements

;; The best package for managing opened files that I've ever used.
;; No more tabbing through 10 open files, and no more counting your open files to Cmd-num to.
(use-package ace-window
  :bind
  ("M-o" . ace-window)
  :config
  (set-face-attribute 'aw-leading-char-face nil
                      :foreground "deep sky blue"
                      :weight 'bold
                      :height 2.0) ;; Some nice formatting to make the letters more visible
  (setq aw-scope 'frame)
  (setq aw-dispatch-always t)
  (setq aw-keys '(?q ?w ?e ?r ?a ?s ?d ?f))
  (setq aw-dispatch-alist '((?c aw-swap-window "Ace - Swap Window")
                            (?n aw-flip-window)))
  (ace-window-display-mode t))

;; Sort M-x by recently used, I can't believe this isn't a default already.
(use-package smex)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :after evil
	:init (which-key-mode)
	:diminish which-key-mode
	:config (setq which-key-idle-delay 0.3))

(use-package rainbow-mode
  :defer t
  :hook (org-mode
         emacs-lisp-mode
         web-mode
         typescript-mode
         js2-mode))

;; Begin evil config

;; Optional for vim users
(use-package evil
  :init
  (evil-mode t))

;; emms play music
(use-package emms
  :commands emms
  :config
  (require 'emms-setup)
  (emms-standard)
  (emms-default-players))

(use-package tracking
  :defer t
  :config
  (setq tracking-faces-priorities '(all-the-icons-pink
                                    all-the-icons-lgreen
                                    all-the-icons-lblue))
  (setq tracking-frame-behavior nil))

;; telegram
(advice-add 'tracking-add-buffer :around #'my/around-tracking-add-buffer)
(advice-add 'tracking-remove-buffer :after #'my/after-tracking-remove-buffer)
(advice-remove 'tracking-remove-buffer #'my/around-tracking-remove-buffer)

(use-package telega
  :commands telega
  :config
  (setq telega-user-use-avatars nil
        telega-use-tracking-for '(any pin unread)
        telega-chat-use-markdown-formatting t
        telega-emoji-use-images t
        telega-completing-read-function #'ivy-completing-read
        telega-msg-rainbow-title nil
        telega-chat-fill-column 75
        telega-server-libs-prefix "/usr"))

;; erc(irc client)
(use-package erc-hl-nicks
  :after erc)

(use-package erc-image
  :after erc)

(use-package erc
  :commands erc
  :config
  (setq
      erc-nick "xdream8"
      erc-prompt-for-nickserv-password nil
      erc-auto-query 'bury
      erc-join-buffer 'bury
      erc-interpret-mirc-color t
      erc-rename-buffers t
      erc-lurker-hide-list '("JOIN" "PART" "QUIT")
      erc-track-exclude-types '("JOIN" "NICK" "QUIT" "MODE")
      erc-track-enable-keybindings nil
      erc-track-visibility nil ; Only use the selected frame for visibility
      erc-fill-column 80
      erc-fill-function 'erc-fill-static
      erc-fill-static-center 20
      erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#guix"))
      erc-quit-reason (lambda (s) (or s "Fading out..."))
      erc-modules
      '(autoaway autojoin button completion fill irccontrols keep-place
          list match menu move-to-prompt netsplit networks noncommands
          readonly ring stamp track hl-nicks)))

;;; ORG Mode

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-remove-leading-stars t)
  (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sc" . "src scheme"))
(add-to-list 'org-structure-template-alist '("ts" . "src typescript"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("go" . "src go"))
(add-to-list 'org-structure-template-alist '("yaml" . "src yaml"))
(add-to-list 'org-structure-template-alist '("json" . "src json"))

;;; Markdown

(use-package markdown-mode
  :mode "\\.md\\'"
  :config
  (setq markdown-command "marked")
  (defun my/set-markdown-header-font-sizes ()
    (dolist (face '((markdown-header-face-1 . 1.2)
                    (markdown-header-face-2 . 1.1)
                    (markdown-header-face-3 . 1.0)
                    (markdown-header-face-4 . 1.0)
                    (markdown-header-face-5 . 1.0)))
      (set-face-attribute (car face) nil :weight 'normal :height (cdr face))))

  (defun my/markdown-mode-hook ()
    (my/set-markdown-header-font-sizes))

  (add-hook 'markdown-mode-hook 'my/markdown-mode-hook))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
