;; -*- coding: iso-2022-7bit; mode: lisp-interaction -*-
;;
;;  init.el
;;    - for Emacs24

;;
;;  Debug
;(setq debug-on-error t)

;;
;;  Language settings
(set-language-environment "Japanese")
;(prefer-coding-system 'euc-japan)
(prefer-coding-system 'cp932)

;;
;;  Proxy settings
(defconst proxy-server-string "proxy.canon.co.jp:10080")
(defconst proxy-server-username "aaa030986")
; $B%5!<%S%9$N@_Dj(B
(setq url-proxy-services
      `(("http" . ,proxy-server-string)
	("https" . ,proxy-server-string)))
; $B%Q%9%o!<%I@_Dj4X?t$NDj5A(B
(defun set-proxy-password (s)
  "Sets Proxy server password"
  (interactive
   (list (read-passwd "Proxy Password:")))
  (let ((up-pair (base64-encode-string
		  (concat proxy-server-username ":" s))))
    (setq url-http-proxy-basic-auth-storage
	  `((,proxy-server-string
	     ("Proxy" . ,up-pair))))
    ))
;(setq url-proxy-services
;      '(("http" . "proxy.canon.co.jp:10080")
;	("https" . "proxy.canon.co.jp:10080")
;	("no_proxy" . "^.*canon\\.co\\.jp")))
;(setq url-http-proxy-basic-auth-storage
;      '(("proxy.canon.co.jp:10080" ("Proxy" . "YWFhMDMwOTg2OmRpYW1hbnRyaW4="))))

;;
;;  Package settings
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(when (not package-archive-contents)
  (package-refresh-contents))
;; Add in your own as you wish:
;;(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings)
;;  "A list of packages to ensure are installed at launch.")
;;(dolist (p my-packages)
;;  (when (not (package-installed-p p))
;;    (package-install p)))


;;
;; Favaroite settings
(line-number-mode t)		; $B9THV9fI=<(%b!<%I(B
(column-number-mode t)		; $B%+%i%`0LCVI=<(%b!<%I(B
(icomplete-mode 1)		; completion $B;~$KA4%(%s%H%j$rI=<($9$k(B
;;(resize-minibuffer-mode 1)	; $B%_%K%P%C%U%!$N%5%$%:$r2DJQ$K(B
(auto-compression-mode 1)	; $B05=L%U%!%$%k$r<+F005?-(B
(setq
 scroll-step 1			; $B$b$O$d(B1$B9T%9%/%m!<%k$b2DG=$J$/$i$$B.$$$@$m(B
 gc-cons-threshold 600000	;$B%,!<%Y!<%8%3%l%/%7%g%s(B
 make-backup-files nil		; $B%P%C%/%"%C%W%U%!%$%k$r:n$i$J$$(B
 next-line-add-newlines nil	; $B:G=*9T$rDI2C$7$J$$(B
 mouse-yank-at-point t		; $B%^%&%90LCV$G$J$/%]%$%s%?0LCV$K(B yank $B$9$k(B
 blink-matching-paren t		; $BBP1~$9$k3g8L$r%A%'%C%/(B
 visible-bell t			; $B%T%C%T%C$H$&$k$5$$$+$i$J(B
 kill-whole-line t		; $B9TF,$N(B C-k $B$G9TA4BN$r>C$9$h$&$K$9$k(B
 read-quoted-char-radix 16	; $B%/%*!<%HJ8;z$O(B16$B?J$,$h$$(B
 find-file-existing-other-name t ; sym-link $B$J$IF1$8<BBN$rJT=8;~$K7Y9p(B
 frame-title-format (concat "%b - " (user-login-name) "@" (system-name))
				; $B%U%l!<%`%?%$%H%k(B
 user-mail-address "akashi.masamichi@canon.co.jp"
				; $B%a!<%k%"%I%l%9(B
; browse-url-browser-function 'browse-url-netscape
				; URL$B%V%i%&%:;~$O(B Netscape $B$G1\Mw$9$k(B
 auto-save-mode nil ; Turn off auto save
 auto-save-list-file-name nil	; .save-pid-domain-name~ $B$r:n$i$J$$(B
 auto-save-list-file-prefix nil	; $B$3$l$b(B .save...
 transient-mark-mode t ; show paren
 )

;;
;; remove bars
(menu-bar-mode -1)
(tool-bar-mode -1)

;;
;; Color Theme
(require `color-theme)
(color-theme-initialize)
(color-theme-pierson)
;;
;; $B%$%?%j%C%/$d%\!<%k%I%U%)%s%H$rI8=`%U%)%s%H$+$i:n@.$9$k(B
(setq w32-enable-synthesized-fonts t)

;;
;; #!$B$,%U%!%$%k$N@hF,$K$"$C$?$i<B9T8"$rIUM?$9$k(B
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;;
;; emacs client
(when (and (>= emacs-major-version 23)
	   (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t))
(unless (server-running-p)
  (server-start))
(remove-hood
 'kill-buffer-query-functions
 'server-kill-buffer-query-function)


;;
;; Key bindings
(global-unset-key "\C-h")
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xl" 'goto-line)
(global-set-key "\C-r" 'scroll-down)
(global-set-key "\C-x5" 'split-window-horizontally)

(cd "c:/Users/030986/Desktop")
