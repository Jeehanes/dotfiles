;; Melpa for packages
;; So far (14-09-2016) I have looked into:
;; org mode, auto-complete-mode, and ido
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
;;next 2 lines for exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'use-package)
;;auto-complete (from Mike Zamansky)
;;
(use-package auto-complete
	     :ensure t
	     :init
	     (progn
	       (ac-config-default)
	       (global-auto-complete-mode t)
	       ))
;;=============================================================================
;;Python section, elpy, flycheck
(defvar myPackages
  '(better-defaults
    elpy
    flycheck ;; add the flycheck package
    ))

;; disable horrid indentation marker
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

;;(global-linum-mode t) ;; enable line numbers globally

(elpy-enable)

; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;;End of Python section
;;============================================================
(use-package org-ac
	     :ensure t
	     :init (progn
		     (require 'org-ac)
		     (org-ac/config-default)
		     ))


;; add dictionary dir
(add-to-list 'ac-user-dictionary-files "~/.emacs-d/dict/dutch")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "d8dc153c58354d612b2576fea87fe676a3a5d43bcc71170c62ddde4a1ad9e1fb" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-color "#404040")
 '(gnus-logo-colors (quote ("#4c8383" "#bababa")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(package-selected-packages
   (quote
    (exec-path-from-shell use-package swiper python-mode python org-ac org multi-term mentor flycheck evil elpy cedit avy auctex alect-themes abyss-theme)))
 '(vc-annotate-background "#404040")
 '(vc-annotate-color-map
   (quote
    ((20 . "#ea4141")
     (40 . "#db4334")
     (60 . "#e9e953")
     (80 . "#c9d617")
     (100 . "#dc7700")
     (120 . "#bcaa00")
     (140 . "#29b029")
     (160 . "#47cd57")
     (180 . "#60a060")
     (200 . "#319448")
     (220 . "#078607")
     (240 . "#1ec1c4")
     (260 . "#1ba1a1")
     (280 . "#26d5d5")
     (300 . "#58b1f3")
     (320 . "#00a2f5")
     (340 . "#1e7bda")
     (360 . "#da26ce"))))
 '(vc-annotate-very-old-color "#da26ce")
 '(xterm-mouse-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffer-menu-buffer ((t (:weight bold :height 1.5 :family "Deja Vu Sans Mono")))))
 ;;; Unbind 'C-x f'
(global-unset-key "\C-xf")

;; Use f12 to save current buffer
;; C-x-s is the normal Emacs way
(global-set-key (kbd "<f12>") 'save-buffer)

;; 

;; Activate Evil mode
(global-set-key (kbd "<f9>") 'evil-mode)
;; Deactivate Evil mode
(global-set-key (kbd "<S-f9>") 'evil-emacs-state)

;; Activate Ido mode for buffer swichting (buffers in the modeline)
    (require 'ido)
    (ido-mode t)

    (require 'ivy)
    (ivy-mode t)

;;:::::Heere starteth the init file of one Matthew Ozor
;;:::::We need to pick the options we like and discard the rest.
;;:::::In case of doute we comment the line out, lest we entaminate unpredictable behaviour
;; all roads lead home
(cd "~/")

;; set default load path
;;(setq load-path (cons "~/.emacs.d/" load-path))

;; turn off welcome screen
(setq inhibit-startup-message t) 

;; set frame size and position
(add-to-list 'default-frame-alist '(top . 1))
(add-to-list 'default-frame-alist '(left . 1))
;; home, jd check whether this is OK 
(if (string= (system-name) "shiling")
    (progn
      (add-to-list 'default-frame-alist '(height . 62))
      (add-to-list 'default-frame-alist '(width . 120))))
  
;; Set the text for titlebar and icons
;; not much use in cwm:\)
(if window-system
    (setq frame-title-format (list "GNU Emacs " emacs-version "@" (system-name) " [buffer: %b]"))
          icon-title-format "Emacs")

;; turn on/off menu bar
;;jd Switched off for now because in some modes it's like Help
;;(menu-bar-mode t)

;;turn on/off toolbar
(tool-bar-mode -1)

;; turn on/off scroll bars
(toggle-scroll-bar t)

;; show column-number in mode line
(column-number-mode t)

;; turn on syntax highlighting
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1))        ; GNU Emacs

;; turn on parentheses highlighting
(show-paren-mode)

;;turn on highlight changes
(highlight-changes-mode t)

;; display date and time always
(setq display-time-day-and-date t)
(display-time)
;;(setq display-time-string-forms
;;    24-hours ":" minutes " ")
 		    
;; show file size
(size-indication-mode)

;; type "y"/"n" instead of "yes"/"no"
(fset 'yes-or-no-p 'y-or-n-p)

;; disable backup files
(setq make-backup-files nil)

;; disable auto save
(auto-save-mode -1)

;; autosave history on eshell
(setq eshell-save-history-on-exit t)

;; keep ediff in one frame
;(ediff-setup-windows-plain)

;; turn off word wrap
;;jd Original: (setq default-truncate-lines 1)
;; From http://stackoverflow.com/questions/3281581/how-to-word-wrap-in-emacs:

(visual-line-mode t)
(global-visual-line-mode t)

;; turn on fancy prompts in the shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; turn off shell command echo
(defun my-comint-init () 
  (setq comint-process-echoes t)) 
(add-hook 'comint-mode-hook 'my-comint-init) 

;; line numbers
;;(require 'linum))

;; Session management
(desktop-save-mode 1)
(setq elpy-rpc-python-command "/usr/local/bin/python3")
