;;; -*- coding: iso-2022-jp -*-
;;;[]-----------------------------------------------------------------[]
;;;|                                                                   |
;;;|                              .emacs                               |
;;;|                                                                   |
;;;|- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|
;;;|                                                                   |
;;;|            $B$3$N(B .emacs $B$O!$(Bemacs-20/emacs-21 $BMQ$G$9!#(B             |
;;;|   emacs-19.xx $B$d(B XEmacs $B$d(B mule-19.xx $B$J$I$K$OBP1~$7$F$$$^$;$s(B    |
;;;|                                                                   |
;;;|      $B$_$?$K$N(B .emacs $B$rGR<Z(B                                       |
;;;|      (recursive $BLdBj$,2r7h$G$-$J$+$C$?$+$i(B(;;)                    |
;;;[]-----------------------------------------------------------------[]

;;------------------------------
;; $B%G%P%C%0(B
;;
;(setq debug-on-error t)

;;------------------------------
;; $BJXMx%^%/%m(B
;;

;; $B%j%9%H$N@hF,$KDI2C(B
;;(defmacro push (elm list)
;;  "ELM $B$r(B LIST $B$N@hF,$KDI2C(B"
;;  (list 'setq list (list 'cons elm list)))

;;------------------------------
;; Exec Path $B$N@_Dj(B
;;
;(push (expand-file-name "~/bin") exec-path)
;(push (expand-file-name "/usr/local/mh") exec-path)
;(push (expand-file-name "/usr/gnu/bin") exec-path)

;;------------------------------
;; Load Path $B$N@_Dj(B
;;
(push (expand-file-name "~akashi/lib/lisp") load-path)
;; for CentOS Japanese Environment
(push "/usr/local/share/emacs/site-lisp/anthy/" load-path)

;;;------------------------------
;;; $B8@8l(B/$BJ8;z%3!<%IBN7O(B
;;;
(set-language-environment "Japanese")

(prefer-coding-system 'euc-japan)
;(set-default-coding-systems 'euc-japan)
;(set-buffer-file-coding-system 'euc-japan t)
;(set-keyboard-coding-system 'euc-japan)

(if (not window-system)
    (set-terminal-coding-system 'euc-japan))


(partial-completion-mode 1)	; $B8-$$(B completion
(transient-mark-mode 0)		; $B%j!<%8%g%s$r%O%$%i%$%H$7$J$$(B
(global-font-lock-mode)

(if (not window-system)
    (progn
      (load "term/vt100")		; vt100 $B$G=i4|2=(B
      (menu-bar-mode nil)))		; $B%a%K%e!<$J$7(B

;;;------------------------------
;;; emacs-21.x $B$N$_(B
;;;
(if (eq (string-to-int emacs-version) 21)
    (progn
      (setq recursive-load-depth-limit nil)
      ))

;;------------------------------
;; $B3F<o@_Dj(B
;;
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
 user-mail-address "akashi@ccm.canon.co.jp"
				; $B%a!<%k%"%I%l%9(B
 browse-url-browser-function 'browse-url-netscape
				; URL$B%V%i%&%:;~$O(B Netscape $B$G1\Mw$9$k(B
 auto-save-list-file-name nil	; .save-pid-domain-name~ $B$r:n$i$J$$(B
 auto-save-list-file-prefix nil	; $B$3$l$b(B .save...
 )


;;------------------------------
;; $B2hLL(B/$B%-!<@_Dj(B
;;
(global-unset-key "\C-h")
(global-set-key "\C-h" 'delete-backward-char)
;;(load "term/bobcat")		; DEL <--> ^H

;;------------------------------
;; $B$=$NB>%-!<%P%$%s%I(B
;;
;(global-set-key "\C-xq" 'indent-region)
(global-set-key "\C-x\C-a\C-i" 'change-tab-width)
;(global-set-key "\C-xw" 'w3)
;(global-set-key "\C-xw" 'browse-url)
(global-set-key "\C-xw" 'browse-url-netscape)
;(global-set-key "\C-xl" 'goto-line)
;(global-set-key "\C-xc" 'compile)
(global-set-key "\M-%" 'query-replace)
(global-set-key "\C-x%" 'query-replace-regexp)
(global-set-key "\M-#" 'ispell-word)
;;(global-set-key "\C-h" 'backward-delete-char-untabify)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-?" 'help-for-help)
(global-set-key "\M-s" 'search-forward)
(global-set-key "\M-r" 'search-reverse)
(global-set-key "\C-x{" 'shrink-window)
(global-set-key "\C-x}" 'grow-window)
(global-set-key "\C-x]" 'goto-matching-fence)
(global-set-key "\C-r" 'scroll-down)
(global-set-key "\C-x4=" 'what-line)
(global-set-key "\M-v" 'scroll-one-line-up)
(global-set-key "\M-r" 'scroll-one-line-down)
(global-set-key "\M-\C-l" 'move-to-window-line)
(global-set-key "\M-k" 'roma-kana-region)
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\C-x\C-y" 'insert-today)
(global-set-key "\M-q" 'fill-region)
(define-key esc-map "\C-x" 'lisp-send-defun)


;;
;; $B%-!<%"%5%$%s(B
;;

(global-set-key "\C-x5" 'split-window-horizontally)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-r" 'scroll-down)
(global-set-key "\C-z" 'scroll-one-line-up)
;;(global-set-key "\C-q" 'scroll-one-line-down)
(global-set-key "\M-q" 'cursor-top-of-screen)
(global-set-key "\C-x!" 'recenter-line-top-of-screen)
(global-set-key "\C-xl" 'what-line)
(global-set-key "\M-t" 'toroku-region)
					;
					; Utility $B$KBP$9$k%-!<%"%5%$%s(B
					;
					;(global-set-key "\C-c\C-j" 'jupiter)
(global-set-key "\C-x\C-m" 'compile)	;;; this is also ^X-RET
(global-set-key "\C-x\C-g" 'gdb)
(global-set-key "\C-x\C-p" 'shell)
(global-set-key "" (quote screen-up-one-line))
(global-set-key "\C-c\C-d" 'vc-diff)
(global-set-key "\C-c\C-i" 'vc-next-action)
(global-set-key "\C-c\C-l" 'vc-print-log)
(global-set-key "\C-c\C-o" 'vc-toggle-read-only)
(global-set-key "\C-c\C-s" 'rcs-status)
(global-set-key "\C-c\C-u" 'rcs-unlock)
(global-set-key "\C-c\C-w" 'rcs-who)
(global-set-key "\C-x\C-q" 'vc-toggle-read-only)
(global-set-key "\e#" 'calc-dispatch)
					;
					; for 'Egg'
					;(global-set-key "\et" 'toroku-region)
					;(global-set-key "\ed" 'edit-dict-item)
;;(global-set-key "\C-`" 'toggle-egg-mode)
;(define-key fence-mode-map "\C-h" 'fence-backward-delete-char)
;(define-key henkan-mode-map "\C-h" 'henkan-quit)
					;
					; for mail
;;(define-key mail-mode-map "\C-c\C-f\C-r" 'mail-reply-to)
					;
					; $B%+%9%?%`4X?t$KBP$9$k%-!<%"%5%$%s(B
					;
(global-set-key "\M-\C-l" 'switch-to-other-buffer)
(global-set-key "\M-q" 'cursor-top-of-screen)
(global-set-key "\C-x!" 'recenter-line-top-of-screen)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xl" 'goto-line)
					;
					; C-sig $B$X$N%-!<%"%5%$%s(B
					;

;;------------------------------
;; $B%U%!%$%k$N@hF,$,!V(B#!$B!W$J$iJ]B8;~$K<B9T%Q!<%_%C%7%g%s$r@_Dj(B
;;
(defun chmod-a+x (file)
  "Set all x-bits of `file'."
  (interactive "fChmod a+x to file: ")
  (let ((octal-111 73))
    (set-file-modes file (logior (file-modes file) octal-111))))

(add-hook 'after-save-hook
	  (function
	   (lambda ()
	     (save-restriction
	       (widen)
	       (if (string= "#!" (buffer-substring 1 (min 3 (point-max))))
		   (chmod-a+x (buffer-file-name)))))))

;;------------------------------
;; $B%F%s%W%l!<%H(B
;;
(require 'autoinsert)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-query nil
      auto-insert-directory "~/lib/template/"
      auto-insert-alist
      (append '(
		("\\.awk$" . '(insert "#!/usr/bin/awk\n\n"))
		("\\.pl$" . '(insert "#!/usr/bin/perl -w\n\n"))
		("\\.rb$" . '(insert "#!/usr/local/bin/ruby\n\n"))
		("\\.sh$" . '(insert "#!/bin/sh\n\n"))
;		("\\.c$" . "c-insert.c")
;		("\\.h$" . "c-insert.h")
;		("\\.cc$" . "c++-insert.cc")
		("\\.e$" . "eiffel-insert.e")
		;;("\\.html$" . "html-insert.html")
		("\\.sgml$" . "sgml-insert.html")
		("\\.tex$" . "tex-insert.tex"))
	      auto-insert-alist))

;;------------------------------
;; EGG
;;
;(setq jserver-list '("slume2" "troika"))
;(load "hira")				; $BFH<+$N%m!<%^;z"*$R$i$,$JJQ49(B
;(load "egg-keymap")			; Sun$B%U%!%s%/%7%g%s%-!<BP1~(B
(setq enable-double-n-syntax t)		; $B!V(Bnn$B!W$r!V$s!W$K$9$k(B
(setq use-kuten-for-period t)		; "$B%T%j%*%I(B" $B$r!V!#!W$K$9$k(B
(setq use-touten-for-comma nil)		; "$B%+%s%^(B" $B$r!V!"!W$K$7$J$$(B
;; $B%-!<@_Dj(B
(global-set-key "\C-xt" 'toroku-region)
;(global-set-key "\C-o" 'toggle-egg-mode)
;(if (boundp 'fence-mode-map)
;    (progn
;      (define-key fence-mode-map "\C-h" 'fence-backward-delete-char)
;      (define-key henkan-mode-map "\C-h" 'henkan-quit)))
;(if (boundp 'henkan-mode-map)
;    (define-key henkan-mode-map "\e?" 'henkan-help-command))
;;(define-key fence-mode-map "\C-h" 'fence-backward-delete-char)
;;(define-key henkan-mode-map "\C-h" 'henkan-quit)
;;(define-key henkan-mode-map "\e?" 'henkan-help-command)

;;------------------------------
;; Boiled Egg
;;
;(autoload 'boil "boiled-egg" "Boiling egg..." t)
;(setq rK-trans-key "\M- ")
;(setq rhkR-trans-key "\M- ")
;(setq rRkh-trans-key "\M- ")
;(global-set-key "\240" 'rK-trans)
;(global-set-key "\240" 'rhkR-trans)
;(global-set-key "\240" 'rRkh-trans)
;(global-set-key "\C-x\C-\\" 'boil)

;;------------------------------
;; Comint, Shell, Shell+, gdb...
;;
(add-hook 'comint-mode-hook
	  '(lambda ()
	     (local-set-key "\M-n"
			    'comint-next-matching-input-from-input)
	     (local-set-key "\M-p"
			    'comint-previous-matching-input-from-input)))
(add-hook 'shell-mode-hook
	  '(lambda ()
	     (define-key shell-mode-map "\C-ct" 'dirs)
	     (setq sh-prompt-pattern "^[^ ]*@[^ ]*[>#%] ?"
		   shell-pushd-tohome t
		   shell-pushd-dunique t
		   shell-last-dir t)
	     (if (and (boundp 'mule-version)
		      (string-match "^2\\." mule-version))
		 (define-program-coding-system ".*shell.*" nil
		   (cons *euc-japan*unix *euc-japan*unix))
	       (set-buffer-file-coding-system 'euc-japan))
             (add-hook 'comint-output-filter-functions
		       'comint-watch-for-password-prompt)))
(autoload 'shell+-switch-to-buffer "shell+" "Shell mode extension kit" t)
;(global-set-key "\C-x\C-j" 'shell)
(global-set-key "\C-x\C-j" 'shell+-switch-to-buffer)

(defvar gud-gdb-history '("gdb "
			  "/usr/local/pilot/bin/m68k-palmos-coff-gdb "))

;(add-hook 'gdb-mode-hook
;	  '(lambda ()
;	     (setq gud-gdb-history
;		   '("gdb "
;		     "/usr/local/pilot/bin/m68k-palmos-coff-gdb "))
;	     ))

;;------------------------------
;; Supercite: $B<+J,MQ$N0zMQ%X%C%@(B
;;
(defun convert-date-string-j-mail (date)
  "$B%a!<%k$NF|IU$rF|K\8l$KJQ49$9$k(B"
  (let (year month day week hour min sec tz)
    (string-match "^ *\\([A-Z][a-z][a-z]\\),? +\\([0-9]+\\) +\\([A-Z][a-z][a-z]\\) +\\([0-9]+\\) +\\([0-9]+\\):\\([0-9]+\\):\\([0-9]+\\) +\\([^ ]+\\) *$" date)
    (setq week
	  (cdr (assoc
		(substring date (match-beginning 1) (match-end 1))
		'(("Sun" . "$BF|(B") ("Mon" . "$B7n(B") ("Tue" . "$B2P(B") ("Wed" . "$B?e(B")
		  ("Thu" . "$BLZ(B") ("Fri" . "$B6b(B") ("Sat" . "$BEZ(B") ("" . "") ))))
     (setq day (string-to-int
		(substring date (match-beginning 2) (match-end 2))))
     (setq month
	   (cdr (assoc
		 (substring date (match-beginning 3) (match-end 3))
		 '(("Jan" . 1) ("Feb" . 2) ("Mar" . 3) ("Apr" . 4)
		   ("May" . 5) ("Jun" . 6) ("Jul" . 7) ("Aug" . 8)
		   ("Sep" . 9) ("Oct" . 10) ("Nov" . 11) ("Dec" . 12)))))
     (setq year (% (string-to-int 
		    (substring date (match-beginning 4) (match-end 4)))
		   100))
     (setq hour (string-to-int
		 (substring date (match-beginning 5) (match-end 5))))
     (setq min (string-to-int
		(substring date (match-beginning 6) (match-end 6))))
     (setq sec (string-to-int
		(substring date (match-beginning 7) (match-end 7))))
     (setq tz (substring date (match-beginning 8) (match-end 8)))
     (format "'%02d$BG/(B%02d$B7n(B%02d$BF|(B(%s)%02d$B;~(B%02d$BJ,(B(%s)"
	     year month day week hour min tz)))

;;------------------------------
;; xcite
;;
(autoload 'xcite "xcite" "Exciting cite" t)
(autoload 'xcite-yank-cur-msg "xcite" "Exciting cite" t)
(defun xcite-my-header ()
  "$BF|K\8l$G$N0zMQ(B"
  (if (string-match "jp$" id)
      (format "\%s$B$5$s$N(B%s$B:"$N%a!<%k(B:\n"
	      (if (string< "" tag) (concat "$B!X(B" tag "$B!Y(B") "")
	      (convert-date-string-j-mail date))
    (format ">>>>> On %s\n>>>>> %s%s said:\n"
	    date (or id "") (if handle (concat "(" handle ") ") ""))))
(setq xcite:insert-header-function 'xcite-my-header)

;;------------------------------
;; xface
;;
(autoload 'x-face-encode "x-face" "Generate X-Face string(s) from xbm file." t)
(autoload 'x-face-insert "x-face" "Insert X-Face fields." t)
(autoload 'x-face-save "x-face" "Save X-Face fields to files." t)
(autoload 'x-face-view "x-face" "View X-Face fields." t)
(autoload 'x-face-ascii-view "x-face"
  "View X-Face fields as ascii pictures." t)

(add-hook
 'x-face-load-hook
 (lambda ()
   (setq x-face-inhibit-loadup-splash t	; x-face $B$N%9%W%i%C%7%e2hLL$N%Q%9(B
	 x-face-image-file-directory "~/lib/xfaces"
	 highlight-headers-hack-x-face-p t
	 x-face-add-x-face-version-header t
	 x-face-insert-interactive nil
	 x-face-mule-use-cache-file t
	 x-face-mule-force-save-cache-file t)))

(autoload 'select-xface "select-xface" nil t)
(setq select-xface-directory "~/lib/xfaces")
(setq select-xface-add-x-face-version-header t) ;; header
(setq select-xface-height 6) ;; for XEmacs
(add-hook 'wl-draft-mode-hook  ;; Wanderlust
          (lambda ()
            (define-key (current-local-map) "\C-c\C-f"
              'select-xface)))

;;------------------------------
;; mew
;; $B$b$&$D$+$o$J$$$G$7$g$&(B
;;
;(global-set-key "\C-xm" 'mew)
;(global-set-key "\C-x\C-m" 'mew-send)
;(autoload 'mew "mew" nil t)
;(autoload 'mew-send "mew" nil t)
;(autoload 'mc-install-write-mode "mailcrypt" nil t)
;(autoload 'mc-install-read-mode "mailcrypt" nil t)
;(add-hook 'mew-draft-mode-hook 'mc-install-write-mode)
;(add-hook 'mew-letter-mode-hook 'mc-install-read-mode)
;
;(add-hook 'mew-init-hook
;	  (function
;	   (lambda ()
;	     (setq
;	      ;; $B%I%a%$%s%3%s%W%j!<%7%g%sMQ%j%9%H(B
;	      mew-mail-domain-list '("canon.co.jp"	; $B@hF,$O<+J,$N%I%a%$%s(B
;				     "ccm.canon.co.jp"
;				     "pure.cpdc.canon.co.jp"
;				     "boarderz.com"
;				     "cts.canon.co.jp"
;				     "osawa.csl.sony.co.jp")
;	      ;; $B%U%)%k%@%j%9%H%U%!%$%k$r;HMQ(B
;	      mew-use-folders-file-p t
;	      ;; from
;	      mew-from "Keisuke Mitani <mitani.keisuke@canon.co.jp>"
;	      mew-from-list '("Keisuke Mitani <keisuke@cse.canon.co.jp>"
;			      "Keisuke Mitani <keisuke@ccm.canon.co.jp>"
;			      "Keisuke Mitani <keisuke@boarderz.com>")
;	      ;; Summary Buffer is ~/
;	      mew-summary-trace-directory nil
;	      ;; $B%G%bI=<((B
;	      mew-demo nil
;	      ;; $B%P%C%/%"%C%W(B
;	      mew-fcc nil
;	      ;; Reply-To
;	      mew-reply-to nil
;	      ;; emacs-20.x $B;HMQ;~$K%X%C%@$NF|K\8lF~NO$r2DG=$K$9$k(B
;	      ;;mew-use-overlay-keymap nil
;	      ;; $B%"%$%3%s(B
;	      mew-icon-directory (expand-file-name "~/lib/mew/etc")
;	      ;;
;	      mew-field-other-visible nil
;	      ;; pgp
;	      mew-header-alist
;	      '(("X-PGP-Fingerprint:" .
;		 "37 85 33 D4 33 D4 3A 68  F8 DC 72 ED B9 C8 75 0F"))
;	      ;; $B0zMQ(B
;	      mew-cite-fields '("From:" "Date:")
;	      mew-cite-format "$B!X(B%s$B!Y$5$s$+$i$N(B %s $B:"$N%a!<%k(B:\n"
;	      mew-cite-prefix "> "
;	      ;; [End of message] $B$r>C$9(B
;	      ;;mew-end-of-message-string nil
;	      ;;mew-end-of-part-string nil
;	      ;; $B%j%U%!%$%k@h$rL@<(E*$K;XDj(B
;	      mew-refile-guess-alist
;	      '(("To:"
;		 ("portmaster@register.ccm.canon.co.jp" . "+PortDB")
;		 ("hostmaster@register.ccm.canon.co.jp" . "+PortDB")
;		 ("system@register.ccm.canon.co.jp" . "+PortDB")
;		 ("mew-dist@mew.org" . "+mew-dist")
;		 ("pilot-ml@pilot-jp.net" . "+pilot")
;		 ("pilot-ml@ml.maple.or.jp" . "+pilot")
;		 ("pilot-ml@news.maple.or.jp" . "+pilot")
;		 ("pilot-tech-ml@pilot-jp.net" . "+pilot-tech")
;		 ("pilot-tech-ml@po.xyz.gr.jp" . "+pilot-tech")
;		 ("pilot-tech-ml@ml.maple.or.jp" . "+pilot-tech")
;		 ("pilot-tech-ml@news.maple.or.jp" . "+pilot-tech")
;		 ("palmware@ma.so-net.ne.jp" . "+palmware")
;		 ("palmware-digest@ma.so-net.ne.jp" . "+palmware")
;		 ("palmware-digest@mma.so-net.ne.jp" . "+palmware")
;		 ("changelog-mail-readers@ChangeLog.net" . "+ChangeLog")
;		 ("wmaker-jp@northeye.org" . "+wmaker")
;		 ("wmaker-jp@lists.airs.net" . "+wmaker")
;		 ("gnome@lists.hypercore.co.jp" . "+gnome")
;		 ("fusion@cpdc.canon.co.jp" . "+fusion")
;		 ("logical@cpdc.canon.co.jp" . "+logical")
;		 ("debian-users@debian.or.jp" . "+debian-users")
;		 ("FreeBSD-users-jp@jp.freebsd.org" . "+FreeBSD")
;		 ("newton@ml.h.kyoto-u.ac.jp" . "+NewtonML")
;		 ("newsoft@lists.pilotgear.com" . "+PilotGear")
;		 ("snow@boarderz.com" . "+snowboard")
;		 ("newt_news@io.com" . "+NewtNews")
;		 ("niku@karak.ccm.canon.co.jp" . "+niku")
;		 ("ftpd@jp.win.ne.jp" . "+ftpd")
;		 ("installer@jp.win.ne.jp" . "+installer")
;		 ("gtk@lists.hypercore.co.jp" . "+gtk")
;		 ("linux-users@linux.or.jp" . "+linux-users")
;		 ("linux-new@his.ktarn.or.jp" . "+linux-news")
;		 ("ugtop@espada.net" . "+ugtop")
;		 )
;		("From:"
;		 ("portmaster@register.ccm.canon.co.jp" . "+PortDB")
;		 ("hostmaster@register.ccm.canon.co.jp" . "+PortDB")
;		 ("system@register.ccm.canon.co.jp" . "+PortDB")
;		 ("cim@cpdc.canon.co.jp" . "+cim")
;		 ("bubbly91@cpdc.canon.co.jp" . "+bubbly91")
;		 ))
;	      ;; 
;	      mew-field-spec
;	      '(("^Resent-\\(From\\|To\\|Cc\\|Date\\)" t
;		 mew-highlight-header-face-important
;		 mew-highlight-header-face-important)
;		("^Subject:$" t
;		 mew-highlight-header-face-important
;		 mew-highlight-header-face-subject)
;		("^From:$" t
;		 mew-highlight-header-face-important
;		 mew-highlight-header-face-from)
;		("^\\(To\\|Apparently-To\\):$" t
;		 mew-highlight-header-face-important
;		 mew-highlight-header-face-to)
;		("^Cc:$" t
;		 mew-highlight-header-face-important
;		 mew-highlight-header-face-to)
;		("^Newsgroups:$" t
;		 mew-highlight-header-face-important
;		 mew-highlight-header-face-to)
;		("^Date:$" t)
;		("^Mime-Version:$" t)
;		("^Content-" t)
;		("^References:$" t)
;		("^X-Mailer:$" t)
;		("^X-Mew:$" t
;		 mew-highlight-header-face-important
;		 mew-highlight-header-face-xmew)
;		("^X-" t
;		 mew-highlight-header-face-private
;		 mew-highlight-header-face-marginal)
;		("^In-Reply-To:$" t))))))

;(add-hook 'mew-draft-mode-hook
;	  (function
;	   (lambda ()
;	     (define-key mew-draft-mode-map "\C-c\C-y" 'xcite-yank-cur-msg)
;	     (make-local-variable 'require-final-newline)
;	     (setq require-final-newline t)
;	     (set-fill-column 60))))

;;------------------------------
;; mew virtual thread
;;
(eval-after-load "mew" '(require 'mew-virtual-thread))

;;------------------------------
;; read news
;;
;(autoload 'gnus "gnus" "Read network news." t)
(add-hook
 'gnus-group-mode-hook
 (function
  (lambda ()
    (require 'mew-gnus)
    (define-key gnus-group-mode-map "a" 'mew-gnus-post-news))))

(add-hook
 'gnus-summary-mode-hook
 (function
  (lambda ()    
    (define-key gnus-summary-mode-map "a" 'mew-gnus-post-news)
    (define-key gnus-summary-mode-map "r" 'mew-gnus-reply)
    (define-key gnus-summary-mode-map "R" 'mew-gnus-reply-with-citation)
    (define-key gnus-summary-mode-map "f" 'mew-gnus-mail-forward))))

(setq gnus-default-article-saver 'gnus-summary-save-in-mew)

(setq gnus-hook '(lambda () (font-lock-mode 1)))
(setq gnus-select-method '(nntp "news10.ccm.canon.co.jp"))
(setq gnus-nntp-service 119)
(setq gnus-thread-indent-level 2)
(setq gnus-local-timezone "+0900")
(setq gnus-use-generic-path 1)
(setq gnus-use-september t)
(setq mail-host-address "canon.co.jp")
(setq message-user-organization "Office Design Dev. 144, Canon Inc., Tokyo, Japan")
;(setq gnus-background-mode 'dark)	;$B%P%C%/%0%i%s%I$r9u$K$7$?;~$N%+%i!<(B
(setq user-full-name "Masa-Michi Akashi")
(setq gnus-default-article-saver 'gnus-summary-save-in-file)
(setq gnus-use-long-file-name nil)
(add-hook 'gnus-select-group-hook
	  '(lambda ()
	     (setq gnus-auto-select-first nil) ;$B:G=i$r<+F0E*$K%;%l%/%H$7$J$$(B
	     ))
(setq gnus-strict-mime nil)
(setq gnus-subscribe-newsgroup-method 'gnus-subscribe-alphabetically)
;(setq gnus-use-mhe t)
(setq gnus-use-sc t)
(setq gnus-show-all-headers t)
;(setq message-send-mail-function 'message-send-mail-with-mhe)

;;------------------------------
;; post news
;;
(setq signature-file-alist
      '((("Newsgroups" . ("fj" )) . "~/.signature-local")))
;(setq gnus-mail-reply-method 'gnus-mail-reply-using-mhe)
;(setq gnus-mail-forward-method 'gnus-mail-forward-method-using-mhe)
(setq gnus-yank-original-quoting-indicator "| ")
;(setq gnus-mail-other-window-method 'gnus-mail-other-window-using-mhe)

;;------------------------------
;; reply yank format: ">"
;;
(setq mail-yank-original-quoting-indicator ">")
(setq mail-yank-original-default-indentation 2)

;;------------------------------
;; pcl-cvs
;;
(autoload 'cvs-update "pcl-cvs" nil t)
(autoload 'cvs-update-other-window "pcl-cvs" nil t)

;;------------------------------
;; postit
;;
(autoload 'postit "postit" nil t)
;(setq postit-colorize 'dark)

;;------------------------------
;; dired
;;
; Solaris $B$G$N%(%i!<$r$J$/$9(B
(setq dired-load-hook '
      (lambda()
        (setq dired-move-to-filename-regexp  "\\(Jan\\|Feb\\|Mar\\|Apr\\|May\\|Jun\\|Jul\\|Aug\\|Sep\\|Oct\\|Nov\\|Dec\\|1$B7n(B\\|2$B7n(B\\|3$B7n(B\\|4$B7n(B\\|5$B7n(B\\|6$B7n(B\\|7$B7n(B\\|8$B7n(B\\|9$B7n(B\\|10$B7n(B\\|11$B7n(B\\|12$B7n(B\\)[ ]+[0-9]+$BF|(B?[ ]+\\([0-9][0-9]:[0-9][0-9]\\|[0-9][0-9][0-9][0-9]$BG/(B?\\) ")))

;;;------------------------------
;;; NADA
;;;

(add-hook 'c-mode-hook
	  (function
	   (lambda ()
	     (define-key c-mode-map "\C-cf" 'insert-c-file-header)
	     (define-key c-mode-map "\C-cm" 'insert-c-module-header)
	     (define-key c-mode-map "\C-ch" 'insert-h-file-header)
	     (define-key c-mode-map "\C-ca" 'insert-a-file-header)
	     (define-key c-mode-map "\C-cb" 'insert-a-module-header))))

(add-hook 'c++-mode-hook
	  (function
	   (lambda ()
	     (define-key c++-mode-map "\C-cf" 'insert-c++-file-header)
	     (define-key c++-mode-map "\C-cm" 'insert-c++-func-module-header)
	     (define-key c++-mode-map "\C-cc" 'insert-c++-class-module-header)
	     (define-key c++-mode-map "\C-ch" 'insert-h-file-header)
	     (define-key c++-mode-map "\C-ca" 'insert-a-file-header)
	     (define-key c++-mode-map "\C-cb" 'insert-a-module-header))))

(fset 'insert-c-file-header
   "\001\017\025\033!/nada/bin/mkheader -c\015\016\016\006\006")
(fset 'insert-c-module-header
   "\001\017\025\033!/nada/bin/mkheader -m\015\016\016\006")
(fset 'insert-c++-file-header
   "\001\017\025\033!/nada/bin/mkheader -cc\015\016\016\006\006")
(fset 'insert-c++-func-module-header
   "\001\017\025\033!/nada/bin/mkheader -mm\015\016\016\006")
(fset 'insert-c++-class-module-header
   "\001\017\025\033!/nada/bin/mkheader -mc\015\016\016\006")
(fset 'insert-h-file-header
   "\001\017\025\033!/nada/bin/mkheader -h\015\016\016\006\006")
(fset 'insert-a-file-header
   "\001\017\025\033!/nada/bin/mkheader -a\015\016\016\006\006\006\006\006")
(fset 'insert-a-module-header
   "\001\017\025\033!/nada/bin/mkheader -b\015\016\016\006\006")
;;(fset 'insert-c-revision-history
;;   "\001\017\025\033!/nada/bin/mkrevhist -c\015\005")
;;(fset 'insert-a-revision-history
;;   "\001\017\025\033!/nada/bin/mkrevhist -a\015\005")


;;------------------------------
;; BBDB
;;
(autoload 'bbdb         "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-name    "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-company "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-net     "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-notes   "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-insinuate-vm       "bbdb-vm"    "Hook BBDB into VM")
(autoload 'bbdb-insinuate-rmail    "bbdb-rmail" "Hook BBDB into RMAIL")
(autoload 'bbdb-insinuate-mh       "bbdb-mhe"   "Hook BBDB into MH-E")
(autoload 'bbdb-insinuate-gnus     "bbdb-gnus"  "Hook BBDB into GNUS")
(autoload 'bbdb-insinuate-sendmail "bbdb"       "Hook BBDB into sendmail")

;(bbdb-initialize)
(setq bbdb-file "~/.bbdb"
      bbdb-north-american-phone-numbers-p nil
      bbdb-use-pop-up nil		;; $B%]%C%W%"%C%WI=<((B
      bbdb-pop-up-target-lines 0	;; BBDB window$B$N9b$5(B
      bbdb/mail-auto-create-p   'bbdb-ignore-some-messages-hook
      bbdb-ignore-some-messages-alist
      '(("From" .       "MAILER-DAEMON\\|iso-2022-jp\\|ISO-2022-JP"))
      bbdb-pop-up-elided-display        '(creation-date timestamp)
      bbdb-user-mail-names      "akashi@ccm\\.canon\\.co\\.jp"
;      signature-use-bbdb t
      )

;; $B=*N;;~$K!V(Bbbdb database $B$r(B save $B$9$k$+!W$HJ9$/$N$,$&$6$$$N$G$d$a$k(B
(add-hook 'bbdb-after-change-hook
          '(lambda (dummy) (bbdb-save-db nil)))

;; $B<+F0E*$K(B ML $B%U%#!<%k%I$r2C$($k(B
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
(setq bbdb-auto-notes-alist 
      '(
        ("X-ML-Name" (".*" ML 0))
        ("X-Mailer" (".*$" User-Agent 0))
        ("X-Newsreader" (".*$" User-Agent 0))
        ("User-Agent" (".*$" User-Agent 0))))

;;------------------------------
;; Wanderlust
;;
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-draft "wl" "Write  draft  with Wanderlust." t)
(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

;(global-set-key "\C-xm" 'wl)
; $B$=$NB>$N@_Dj$O(B ~/.wl

;;------------------------------
;; Prom-WL
;;
(autoload 'prom-wl "prom-wl" "Prom-WL" t)
(setq proc-log-list (list "%Mail/log.procmail")
      prom-wl-folder-prefix "%#mh/";
;      prom-wl-folder-prefix "+"
      prom-wl-folder-prefix-alist '((imap4 . "%#mh/") (nil . "+"))
      prom-wl-imap4-read-log-func 'prom-wl-imap4-read-log-by-rename
      proc-keep-log "~/Mail/listlog"
      proc-lock-file "~/Mail/.lock"
      prom-wl-keep-log-max-size 2000
      prom-wl-xheader t
      prom-wl-get-new-mail-optional-method 'prom-wl-check-list-folders
      prom-wl-check-folders
      '("%#mh/inbox"
	)
      )

(defun prom-wl-invoke ()
  "prom-wl $B$r5/F0$9$k$,!$I,MW$J$i(B mime-setup $B$rFI$_9~$`(B"
  (interactive)
  (require 'mime-setup)
  (prom-wl))
(global-set-key "\C-xm" 'prom-wl-invoke)

;(add-hook 'wl-folder-mode-hook
;          (lambda ()
;            (define-key wl-folder-mode-map "i" 'prom-wl)))

;;------------------------------
;; mu-cite
;;
(autoload 'mu-cite/cite-original "mu-cite" nil t)
;(add-hook 'mail-citation-hook 'mu-cite/cite-original)

(add-hook 'mu-cite-load-hook
          '(lambda ()
	     (setq mu-cite/top-format
		   '(prefix-register-verbose "$B$5$s(B:\n"))))

;; "$B;0C+$5$s(B>"$B$H(B cite $B$7$F$-$?;~$N!V$5$s!W$r<h$k(B
(add-hook 'mu-cite/pre-cite-hook
          '(lambda ()
             (save-excursion
               (goto-char (point-min))
               (replace-regexp "^\\($B@V;J(B\\|$B$"$+$7(B\\)\\($B$5$s(B\\|$B;a(B\\)>" "$B@V;J(B>")
	       )))

;;------------------------------
;; c-sig
;;
(autoload 'add-signature "c-sig" "c-sig" t)
(autoload 'delete-signature "c-sig" "c-sig" t)
(autoload 'insert-signature-eref "c-sig" "c-sig" t)
(autoload 'insert-signature-automatically "c-sig" "c-sig" t)
(autoload 'insert-signature-randomly "c-sig" "c-sig" t)
(autoload 'write-sig-file "c-sig" "c-sig" t)
(autoload 'read-sig-file "c-sig" "c-sig" t)
(setq sig-replace-string t	; $BJ8;zNsCV$-49$((B
      sig-insert-end t		; mail$BKv$K(B signature $BA^F~(B
      sig-purge t		; $B9TKv$N6uGr9T$N:o=|(B
      sig-separator "--\n"	; signature $B$N%;%Q%l!<%?(B
      sig-save-to-sig-name-alist t ; $BA*Br$7$?(B signature $B$r(B db $B$KJ]B8(B
      sig-default "out\n"	; $B%G%U%)%k%H$N(B signature
      sig-save-file-every-change t ; db $B$r>o$KJ]B8(B
      sig-make-backup nil)	; db $B$N%P%C%/%"%C%W$r:n$k$+(B
(random t)

;;------------------------------
;; FTP
;;
;(setq ange-ftp-gateway-host "canongate")
;(setq ange-ftp-generate-anonymous-password user-mail-address)
;(setq ange-ftp-local-host-regexp "^[^.]+$\\|\\.canon\\(\\.co\\.jp\\)?$")
;(setq ange-ftp-smart-gateway t)

;;------------------------------
;; PGP
;;
;(call-after-loaded
; 'tm-view
; (function
;  (lambda ()
;    (require 'tm-pgp)
;    )))
;(setq mc-pgp-comment nil)
(setq mime-editor/signing-type 'pgp-elkins)
(setq mime-editor/encrypting-type 'pgp-elkins)

;;------------------------------
;; postit
;;
(autoload 'postit "postit" nil t)
;(setq postit-colorize 'dark)

;;------------------------------
;; irchat
;;
(autoload 'irchat "irchat" "GNUemacs IRC client." t)
(add-hook 'irchat-Startup-hook
	  '(lambda ()
	     (setq irchat-server "slume2")
	     (irchat-send "akashi")))

;;------------------------------
;; Dired
;;
(setq dired-listing-switches "-alF")	; ls $B$KEO$9%9%$%C%A(B
(setq dired-ls-F-marks-symlinks nil)	; ls -lF $B$G(Bs-link$B$K!V(B@$B!W$,IU$/$+(B

;;------------------------------
;; look
;;
;(autoload 'look-here "look" nil t nil)
;(global-set-key "\M-L" 'look-here)

;;------------------------------
;; keisen-mode
;;
(autoload 'keisen-mode "keisen-mule" "keisen: Enhanced Picture Mode." t)
(setq next-line-add-newlines nil)	;$B:G=*9T$rDI2C$7$J$$(B

;;------------------------------
;; h2v
;;
(autoload 'h2v-region "h2v" "$BNN0h$r=D=q$-$K$7$^$9!#(B" t)
(autoload 'h2v-buffer "h2v" "$B%P%C%U%!A4BN$r=D=q$-$K$7$^$9!#(B" t)

;;------------------------------
;; migemo - $B%$%s%/%j%a%s%?%k%5!<%AF|K\8lBP1~(B
;;
;;(load "migemo")

;;------------------------------
;; dserver
;;
(autoload 'lookup "lookup" nil t)
(autoload 'lookup-word "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-region-other-frame "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)
(autoload 'lookup-pattern-other-frame "lookup" nil t)
;(setq lookup-search-agents '((ndtp "karak")))
(setq lookup-search-agents '((ndtp "miyabi")))
(global-set-key "\C-xh" 'lookup-pattern)
;(setq truncate-partial-width-windows nil)
;(setq lookup-dserver-host-name "slume2")
;(autoload 'lookup-mode "lookup" "Start Lookup mode with dserver" t)
;(defvar dserver-host-name "slume2") ; dserver $B$,F0$$$F$$$k%[%9%H(B
;(defvar od:*window-config* 6)     ; $B8uJd$rI=<($9$k%&%$%s%I%&$N9T?t(B+1
;(defvar od:*body-fillcolumn* nil) ; $B@bL@$rI=<($9$k;~$N:GBgI}(B $BDL>o$O(Bnil$B$G$h$$(B
;(defvar od:*select-unique-entry-immediately* t) ; $B8uJd$,(B1$B$D$J$i$$$-$J$jI=<((B
;(defvar od:*scroll-step* 'half)   ; $B@bL@J8$r%9%/%m!<%k$9$k;~$N%9%F%C%W(B
;(defvar od:*default-jisyo* nil)   ; $B%G%U%)%k%H<-=q(B(nil,"kojien","eiwa","waei")
;(defvar od:*fep-type* 'egg)       ; 'egg or 't-code
;(autoload 'online-dictionary "diclookup" "Online dictionary." t nil)
;(autoload 'od:lookup-pattern-edit "diclookup" "Look up a word." t nil)
;
;(autoload 'lookup-word   "lookup" nil t)
;(autoload 'lookup-ispell "lookup" nil t)
;(autoload 'lookup-read   "lookup" nil t)
;(setq lookup-host-name "slume2")

;;;------------------------------
;;; disp-zs
;;;
;(require 'disp-zs)
;(set-face-background 'disp-zs-face "grey30")

;;;------------------------------
;;; windows.el
;;;
;;;(load-library "windows")
;(autoload 'win-switch-to-window "windows" "Switch window." t)
;(autoload 'win-show-window-list "windows" "List window." t)
;(autoload 'win-last-window "windows" "Switch to lastwindow." t)
;(global-set-key "\C-c\C-w1" 'win-switch-to-window)

;;------------------------------
;; trr
;;
(autoload 'trr "trr" nil t)
(setq TRR:return-is-space t		; return $B%-!<$r(B space $B$GBeMQ(B
      TRR:japanese t			; $B%a%C%;!<%8$OF|K\8l(B
      TRR:ding-when-miss nil		; miss $B$7$F$b2;$rLD$5$J$$(B
      TRR:un-hyphenate nil)		; $B%O%$%U%M!<%7%g%s$J$7(B

;;------------------------------
;; tab
;;
;(setq default-tab-width 8)
;(setq tab-width 8)
;(setq tab-stop-list '(8 16 24 32 40 48 56 64 72 80 88 96 104 112 120))

;;------------------------------
;; text mode
;;
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;(setq fill-column 60)
(setq auto-mode-alist (cons '("\\.txt$" . text-mode) 
			    auto-mode-alist))

;;------------------------------
;; c-mode
;;
;(add-hook
; 'c-mode-hook
; '(lambda ()
;    (setq c-auto-newline nil
;	  tab-width 8
;	  ;;$B$I$3$K$$$F$b%$%s%G%s%H(B
;	  c-tab-always-indent nil
;	  ;; $B4X?t$N0z?t@k8@$N%$%s%G%s%HNL(B
;	  c-argdecl-indent 2
;	  ;; {$B$H(B}$B$G0O$^$l$?4X?tK\BN$N%$%s%G%s%HNL(B
;	  c-indent-level 4
;	  ;; if$B$J$I$H$=$l$KB3$/%9%F!<%H%a%s%H$N%$%s%G%s%HNL(B
;	  c-continued-statement-offset 4
;	  ;; {$B$KB3$/%9%F!<%H%a%s%H$N%$%s%G%s%HNL(B
;	  c-continued-brace-offset 4
;	  ;; for$BJ8$J$I$N(B{$B$N%$%s%G%s%HNL(B
;	  c-brace-offset -4
;	  ;; $B%i%Y%k$d(Bcase$BJ8$J$I$r%$%s%G%s%H%l%Y%k$+$i$:$i$9NL(B
;	  c-label-offset -2
;	  ;; $B%V%m%C%/K\BN$N%$%s%G%s%HNL(B
;	  c-brace-imaginary-offset 0
;	  ;; $B%3%a%s%H$N%$%s%G%s%HNL(B
;	  comment-colum 40
;	  ;; {$B$KBP1~$9$k(B}$B$rI=<($9$k!#(B
;	  blink-matching-paren t)))

;;------------------------------
;; cc-mode
;;
(require 'cc-mode)
(c-initialize-cc-mode)
(add-hook 'c-mode-common-hook
          (function (lambda ()
                      (c-set-style "bsd") 
		      (setq c-basic-offset 4
			    c-tab-always-indent nil)
                      (define-key c-mode-map "\C-c\C-c" 'compile))))

;;(fmakunbound 'c-mode)
;;(makunbound 'c-mode-map)
;;(fmakunbound 'c++-mode)
;;(makunbound 'c++-mode-map)
;;(makunbound 'c-style-alist)

;;(autoload 'c++-mode  "cc-mode" "C++ Editing Mode" t)
;;(autoload 'c-mode    "cc-mode" "C Editing Mode" t)
;;(autoload 'objc-mode "cc-mode" "Objective-C Editing Mode" t)
;;(autoload 'java-mode "cc-mode" "Java Editing Mode" t)
;;
;;(setq c-tab-always-indent nil)
;;
;;(setq auto-mode-alist
;;      (append '(("\\.C$"     . c++-mode)
;;		("\\.cc$"    . c++-mode)
;;		("\\.hh$"    . c++-mode)
;;		("\\.c$"     . c-mode)
;;		("\\.h$"     . c-mode)
;;		("\\.m$"  . objc-mode)
;;		("\\.java$" . java-mode)
;;		) auto-mode-alist))
;;
;;(add-hook 'c-mode-common-hook
;;          (function (lambda ()
;;                      (c-set-style "bsd") 
;;		      (setq tab-width 8
;;			    c-tab-always-indent nil)
;;                      (define-key c-mode-map "\C-c\C-c" 'compile))))
;;(add-hook 'c-mode-hook
;;          (function (lambda ()
;;                      (c-set-offset 'topmost-intro-cont 4))))
;;(add-hook 'java-mode-hook
;;          (function (lambda ()
;;                      (c-set-offset 'access-label 0)))) 

;;------------------------------
;; lisp-mode
;;
(put 'if 'lisp-indent-hook 1)
(put 'when 'lisp-indent-hook 1)
(put 'unless 'lisp-indent-hook 1)
(put 'do 'lisp-indent-hook 2)
(put 'do* 'lisp-indent-hook 2)
(put 'dotimes 'lisp-indent-hook 2)
(put 'dolist 'lisp-indent-hook 2)
(put 'case 'lisp-indent-hook 2)

;;------------------------------
;; $BBP1~3g8L$NI=<((B
;;
(show-paren-mode)

;;------------------------------
;; perl-mode (perl/cperl)
;;
;(autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
;(push '("\\.[pP][Llm]$" . perl-mode) auto-mode-alist)
;(push '("miniperl" . perl-mode) interpreter-mode-alist)
;(push '("perl4" . perl-mode) interpreter-mode-alist)
;(push '("perl5" . perl-mode) interpreter-mode-alist)
(add-hook 'perl-mode-hook
	  '(lambda ()
	     ;(require 'perlplus)
	     ;(define-key perl-mode-map "\M-\t" 'perlplus-complete-symbol)
	     ;(perlplus-setup)
	     (setq
	      perl-tab-always-indent nil	; $B9TCf$N(BTAB$B$O(BTAB$BJ8;z$H$7$F(B...
	      perl-indent-level 4		; $B%$%s%G%s%H(B/$B9T$NB3$-$O(B4$B%?%V(B
	      perl-continued-statement-offset 4
	      perl-continued-brace-offset 4
	      perl-brace-offset 0
	      perl-brace-imaginary-offset 0
	      perl-label-offset 0		; $B%i%Y%k$r%$%s%G%s%H$7$J$$(B
	      )))
(add-hook 'cperl-mode-hook
	  '(lambda ()
	     (setq
	      cperl-tab-always-indent nil	; $B9TCf$N(BTAB$B$O(BTAB$BJ8;z$H$7$F(B...
	      cperl-indent-level 4		; $B%$%s%G%s%H(B/$B9T$NB3$-$O(B4$B%?%V(B
	      cperl-continued-statement-offset 4
	      cperl-continued-brace-offset 4
	      cperl-brace-offset 0
	      cperl-brace-imaginary-offset 0
	      cperl-label-offset 0		; $B%i%Y%k$r%$%s%G%s%H$7$J$$(B

	      ;cperl-hairy t			; $B?H$NLS$b$h$@$D$h$&$J(B...?!
	      cperl-help t
;;	      (define-key cperl-mode-map "\C-h" 'backward-delete-char)
	      )))
;$B%U%!%$%k%;!<%V;~$K<B9T%U%!%$%k$K$9$k(B
;(add-hook 'after-save-hook
;	  '(lambda ()
;	     (and (memq major-mode '(perl-mode))
;		  (call-process "chmod" nil nil nil
;				"+x" (buffer-file-name)))))

;;------------------------------
;; java-mode
;;

;;------------------------------
;; mmm-mode in php
;;
;;(require 'mmm-mode)
;;(setq mmm-global-mode 'maybe)
;;(mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
;;(mmm-add-classes
;; '((html-php
;;    :submode php-mode
;;    :front "<\\?\\(php\\)?"
;;    :back "\\?>")))
;;(add-to-list 'auto-mode-alist '("\\.php?\\'" . html-mode))

;;------------------------------
;; php-mode
;;
(load-library "php-mode")
(require 'php-mode)
;(setq auto-mode-alist (cons '("\\.php$" . php-mode)
;			    auto-mode-alist))

;;------------------------------
;; html-mode
;;
;;(autoload 'html-mode "hm--html-menu" "HTML major mode." t)
;;(autoload 'html-mode "html-mode" "HTML major mode." t)
;;(setq auto-mode-alist (cons '("\\.html$" . html-mode) 
;;			    auto-mode-alist))
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode)
			    auto-mode-alist))
(add-hook 'html-helper-load-hook
	  (function 
	   (lambda ()
	     ;; Netscape $B3HD%(B
	     (load-library "hhm-netscape")
	     ;; TABLE $B3HD%(B
	     (load-library "tables"))))

(add-hook 'html-helper-mode-hook
	  (lambda ()
	    ;; $B4A;z%3!<%I$N@_Dj(B
;	    (set-buffer-file-coding-system 'iso-2022-jp)
	    ;; outline$B%b!<%IBP1~(B
;;	    (outline-minor-mode t)
	    (make-local-variable 'outline-regexp)
	    (setq outline-regexp "<[Hh][1-6]*>")
	    ;; compile$B%3%^%s%I$G(B htmllint $B$r5/F0(B
	    (define-key html-helper-mode-map "\C-c\C-c" 'compile)
	    (make-local-variable 'compile-command)
	    (setq compile-command (concat "htmllint " buffer-file-name))))
	     
(setq
 ;; $B%?%$%`%9%?%s%W$r<+F099?7(B
 html-helper-do-write-file-hooks t
 ;; $B?7%U%!%$%k%9%1%k%H%sA^F~(B
 html-helper-build-new-buffer t
 ;; $B%G%U%)%k%H%a!<%k%"%I%l%9(B
 html-helper-address-string
 "<A HREF=\"mailto:akashi@ccm.canon.co.jp\">Masa-Michi Akashi</A>"
 ;; $B?75,%P%C%U%!MQ%F%s%W%l!<%H(B
 html-helper-new-buffer-template
; '("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\n"
 '("<!doctype html public \"-//W3C//DTD HTML 3.2//EN\">\n"
   "<html>\n"
   "<!--============================ HEADER ============================-->\n"
   "<head>\n"
   "<meta http-equiv=\"Content-Type\" "
   "content=\"text/html; charset=iso-2022-jp\">\n"
   "<link rev=\"MADE\" href=\"mailto:akashi@ccm.canon.co.jp\">\n"
   "<title>" p "</title>\n"
   "</head>\n"
   "\n"
   "<!--============================= BODY =============================-->\n"
   "<body bgcolor=\"#ffffff\" text=\"#000000\"\n"
   " link=\"#0000ff\" vlink=\"#000080\" alink=\"#ff00ff\">\n"
   "\n"
   "<h1>" p "</h1>\n"
   "\n" p "\n"
   "<!--============================ FOOTER ============================-->\n"
   "<hr>\n"
   html-helper-timestamp-start "\n"
   html-helper-timestamp-end "\n"
   "<br>\n"
   "<address>\n"
   html-helper-address-string "\n"
   "</address>\n"
   "</body>\n"
   "</html>\n"))

(defun html-helper-keisuke-insert-timestamp ()
  "timestamp insertion function for keisuke style."
  ; Thu Sep 12 19:03:57 JST 1996
  (let ((time (current-time-string)))
    (insert "Last modified: "
	    (substring time 0 3)
	    ", "
	    (substring time 4 11)
	    (substring time -4)
	    " "
	    (nth 1 (current-time-zone))
	    "\n")))

(defun html-helper-keisuke-insert-timestamp-j ()
  "$BF|K\8l$N99?7;~4V$rA^F~$9$k(B"
  (require 'time-stamp)
  ;; $B4A;z%3!<%I$N@_Dj(B
  (set-buffer-file-coding-system 'iso-2022-jp)
  (insert "$B:G=*99?7(B: " (time-stamp-yyyy/mm/dd) " "
	  (nth 1 (current-time-zone)) "\n"))

(defun html-helper-keisuke-insert-timestamp-e ()
  "$B1Q8l$N99?7;~4V$rA^F~$9$k(B"
  (require 'time-stamp)
  ;; $B4A;z%3!<%I$N@_Dj(B
  (set-buffer-file-coding-system 'iso-2022-jp)
  (insert "Last Modified: " (time-stamp-yyyy/mm/dd) " "
	  (nth 1 (current-time-zone)) "\n"))

(setq html-helper-timestamp-hook
      'html-helper-keisuke-insert-timestamp-j)
;(add-hook 'tempo-insert-string-functions
;	  'upcase)

;;------------------------------
;; jam-zcat
;;
;(require 'jam-zcat)

;;;------------------------------
;;; Allout outline-mode
;;;

;; outline-mode$B$NBe$j$K(B Allout outline mode $B$r;H$&(B
(require 'allout)
;;(outline-init t)

;;------------------------------
;; $B$A$C$A$c$JJXMx4X?t(B
;;
(defun scroll-one-line-up (&optional arg)
  "$B%+%l%s%H%P%C%U%!$r(B1(N)$B9T%9%/%m!<%k(BUP$B$9$k!#(B"
  (interactive "p")
  (scroll-up (or arg 1)))

(defun scroll-one-line-down (&optional arg)
  "$B%+%l%s%H%P%C%U%!$r(B1(N)$B9T%9%/%m!<%k(BDOWN$B$9$k!#(B"
  (interactive "p")
  (scroll-down (or arg 1)))

(defun cursor-top-of-screen (&optional arg)
  "$B%+!<%=%k$r%+%l%s%H%P%C%U%!$N2hLL>e$N(B1(N)$B9TL\$K0\F0$9$k!#(B"
  (interactive "p")
  (move-to-window-line (or arg 1)))

(defun previous-window-line (n)
  "$B2hLL>e$G$N(B1$B9TA0$K0\F0$9$k(B"
  (interactive "p")
  (let ((cur-col
         (- (current-column)
            (save-excursion (vertical-motion 0) (current-column)))))
    (vertical-motion (- n))
    (move-to-column (+ (current-column) cur-col))))

(defun next-window-line (n)
  "$B2hLL>e$G$N(B1$B9T<!$K0\F0$9$k(B"
  (interactive "p")
  (let ((cur-col
         (- (current-column)
            (save-excursion (vertical-motion 0) (current-column)))))
    (vertical-motion n)
    (move-to-column (+ (current-column) cur-col))))

(defun switch-vertical-move-style (&optional arg)
  "C-p, C-n $B$G0\F0$9$k$N$r2hLL>e$N(B1$B9TC10L$K$9$k!#(B
$B0z?t$,M?$($i$l$?$iDL>o$N(Bemacs$B$HF1$8$h$&$KO@M}9TC10L$K0\F0$9$k$h$&$K$J$k!#(B"
  (interactive "P")
  (if arg
    (global-set-key "\C-p" 'previous-line)
    (global-set-key "\C-p" 'previous-window-line))
  (if arg
    (global-set-key "\C-n" 'next-line)
    (global-set-key "\C-n" 'next-window-line)))

(defun change-tab-width (&optional width)
  "Tab$BI}$r(B8$B"N(B4$B$H@Z$jBX$($k!#(B
$B0z?t$,M?$($i$l$?$i$=$NCM$K%;%C%H$9$k!#(B"
  (interactive "P")
  (setq tab-width
	(if width
	    width
	  (if (equal tab-width 8) 4 8)))
  (message "tab-width = %d" tab-width)
  (redraw-display))

;;------------------------------
;; insert-today
;;
(autoload 'insert-today "insert-today" "insert date tool" t)

;;------------------------------
;; listc
;;
(autoload 'listc-buffer "listc" "listc tools" t)
(autoload 'listc-region "listc" "listc tools" t)

;;------------------------------
;; man $B$NF|K\8lBP1~(B
;;
(setq
 Man-see-also-regexp "SEE ALSO|$B4XO"9`L\(B"	; SEE ALSO $B$N9`L\$rJd40(B
 Man-first-heading-regexp			; $B@hF,%X%C%@(B
 "^[ \t]*NAME$\\|^[ \t]*$B!Z(B*$BL>(B[$BA0>N(B]$B![(B*$\\|^[ \t]*No manual entry fo.*$"
 Man-heading-regexp				; $B%X%C%@(B
 "^\\([A-Z$B!<$!(B-$B$s%!(B-$B%v0!(B-$Bt$!Z(B][A-Z$B!<$!(B-$B$s%!(B-$B%v0!(B-$Bt$![(B \t]+\\)$")

;;------------------------------
;; Set input mode for ^S/^Q
;;
;(cond
; ((eq (string-to-int emacs-version) 18) (set-input-mode nil nil))
; ((eq (string-to-int emacs-version) 19) (set-input-mode nil nil t)))
;(redraw-display)

;;------------------------------
;; gid
;;
(autoload 'gid "id-utils" "GNU ID Utilities" t)

;;------------------------------
;; w3
;;
(autoload 'w3 "w3" "WWW Browser" t)
(setq url-proxy-services
      '(("http" . "proxy10.ccm.canon.co.jp:10080")
	("shttp" . "proxy10.ccm.canon.co.jp:10080")
	("ftp" . "proxy10.ccm.canon.co.jp:10080")
	("gopher" . "proxy10.ccm.canon.co.jp:10080")
	("no_proxy" . "^.*\\.canon\\.co\\.jp$")))

;;------------------------------
;; w3m
;;
(autoload 'w3m "w3m" "*Interface for w3m on Emacs." t)
(autoload 'w3m-find-file "w3m" "*w3m interface function for local file." t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "*Search QUERY using SEARCH-ENGINE." t)
(autoload 'w3m-weather "w3m-weather" "*Display weather report." t)
(autoload 'w3m-antenna "w3m-antenna" "*Report chenge of WEB sites." t)

;;------------------------------
;; 3pm
;;
(autoload 'mpg123 "mpg123" "A Front-end to mpg123" t)
(eval-after-load "mpg123" '(load-library "id3"))

;;------------------------------
;; POBox
;;
;(setq pobox-toggle-key "\C-o")
;(global-set-key pobox-toggle-key 'pobox-mode)
;(autoload 'pobox-mode "pobox")
;(setq pobox-server "localhost")

;;------------------------------
;; xcal
;;
;;(autoload 'xcal "xcal-19"
;;   "xcal for emacs." t)
;;(autoload 'day-of-week "cal")
;;(autoload 'gnus-to-xcal-file "xcal-19")
;;(autoload 'mh-to-xcal-file "xcal-19")
;;(autoload 'generate-month "cal")

;;------------------------------
;; calendar
;;
(setq local-holidays
      '((holiday-fixed  1  1 "$B85C6(B")
	(holiday-fixed  1 15 "$B@.?M$NF|(B")
	(holiday-fixed  2 11 "$B7z9q5-G0F|(B")
	(holiday-fixed  4 29 "$B$_$I$j$NF|(B")
	(holiday-fixed  5  3 "$B7{K!5-G0F|(B")
	(holiday-fixed  5  4 "$B9qL1$N=KF|(B")
	(holiday-fixed  5  5 "$B$3$I$b$NF|(B")
	(holiday-fixed  7 20 "$B3$$NF|(B")
	(holiday-fixed  9 15 "$B7IO7$NF|(B")
	(holiday-fixed 10 10 "$BBN0i$NF|(B")
	(holiday-fixed 11  3 "$BJ82=$NF|(B")
	(holiday-fixed 11 23 "$B6PO+46<U$NF|(B")
	(holiday-fixed 12 23 "$BE79DCB@8F|(B"))
      solar-n-hemi-seasons
      '("$B=UJ,$NF|(B" "$B2F;j(B($B5YF|$8$c$J$$(B)" "$B=)J,$NF|(B" "$BE_;j2F;j(B($B5YF|$8$c$J$$(B)"))
;; $BI,MW$N$J$$3$30$N=KF|$rI=<($7$J$$$h$&$K$9$k(B
(setq all-christian-calendar-holidays nil
      general-holidays nil
      christian-holidays nil
      hebrew-holidays nil
      islamic-holidays nil
      oriental-holidays nil
      solar-holidays t)

;;;------------------------------
;;; $B%+%9%?%^%$%:(B
;;;
;(custom-set-variables
; '(paren-mode (quote blink-paren) nil (paren))
; '(mouse-avoidance-mode nil nil (avoid))
; '(zmacs-regions nil)
; '(url-keep-history t))

;(custom-set-faces)

;;;------------------------------
;;; Disable/Customize
;;;
(put 'mh-print-msg 'disabled t)
;(put 'downcase-region 'disabled t)
(custom-set-variables
 '(font-menu-this-frame-only-p nil)
 '(default-gutter-position (quote top))
 '(default-mime-charset (quote iso-2022-jp))
 '(mime-edit-split-message nil)
 '(mouse-yank-at-point nil)
 '(font-lock-mode nil t (font-lock))
 '(mime-charset-coding-system-alist (quote ((x-unknown . undecided) (unknown . undecided) (windows-874 . tis620) (cn-gb . cn-gb-2312) (gb2312 . cn-gb-2312) (us-ascii . raw-text) (iso-2022-jp . iso-2022-jp)))))
(custom-set-faces)
