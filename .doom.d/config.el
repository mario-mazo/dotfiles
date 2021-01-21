;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set my favorite font
(setq doom-font (font-spec :family "JetBrains Mono" :size 20))

;; use `jj' to exit insert mode and slow it down a bit to avoid false positives
(setq evil-escape-key-sequence "jj"
      evil-escape-delay 0.25)

;; start up using my entire screen but not maximized
(setq initial-frame-alist '((top . 0) (left . 0) (width . 169) (height . 50)))

;; startup default dired directory
(setq default-directory "~")

;; NOTE:
;; use C-x z and keep using z for repeat, ie: `SPC w < C-x zzzzzzzz'
;; (def-key evil-insert-state-map ">>" "->")
;;
;; Undo: in insert mode do C-u to use a more normal undo. If you use u
;; in the normal mode it undos a shit ton of stuff becuase:
;; All the changes done in one instance of Insert mode will be considered as one change.
;; For instance, in Insert mode, you have made 3 changes and then shifted to normal mode.
;; Now if you press `u' once, all the three changes will be undone.

;; useful elixir shortcut for my keybord layout
;; TODO: change `global-map' to `elixir-mode' to make it unique to elixir
(evil-define-key 'insert global-map (kbd "C-.") "->")

(evil-define-key 'insert global-map (kbd "C-,") "|>")

(evil-define-key 'insert global-map (kbd "C-;") "=>")

;; pops up hunk from the fringe
(map! (:leader (:prefix "g" :desc "Pop up hunk" :nv "h" #'git-gutter:popup-hunk)))

;; Bind shift U keys for redo.
(map! "<redo>" #'redo :n "U" #'redo)

;; TODO create bug report with data from big sur and catalina
;; https://github.com/hlissner/doom-emacs/issues/3461
;; (map! :nv "C-d" #'evil-multiedit-match-symbol-and-next
;; :nv "C-D" #'evil-multiedit-match-symbol-and-prev)

;; org-mode configuration
(after! org
  (setq
    org-todo-keywords
         '((sequece "TODO:(t)"
                    "IN-PROGRESS:(i)"
                    "WAITING:(w)"
                    "|"
                    "DONE:(d)"
                    "CANCELED:(c)"))

    ;; sets the keyword colors to match the doom-theme
    org-todo-keyword-faces
    '(("TODO:" :foreground "#FD6464" :weight bold)
     ("IN-PROGRESS:" :foreground "#8EB55E" :weight bold)
     ("WAITING:" . org-warning))

   ;; org-agenda-files (directory-files-recursively "~/org/agenda/" "\.org$")
   ;; org-agenda-files (list "~/org/agenda/projects.org")
  )
)

;; sets my default project  to `repo'
(setq projectile-project-search-path #'("~/repo/") )

;; ignore case for auto-complete in eshell
(setq eshell-cmpl-ignore-case t)
