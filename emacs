;;; -*- coding: iso-2022-jp -*-
;;;[]-----------------------------------------------------------------[]
;;;|                                                                   |
;;;|                              .emacs                               |
;;;|                                                                   |
;;;|- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|
;;;|                                                                   |
;;;|            この .emacs は，emacs-20/emacs-21 用です。             |
;;;|   emacs-19.xx や XEmacs や mule-19.xx などには対応していません    |
;;;|                                                                   |
;;;|      みたにの .emacs を拝借                                       |
;;;|      (recursive 問題が解決できなかったから(;;)                    |
;;;[]-----------------------------------------------------------------[]

;;------------------------------
;; デバッグ
;;
;(setq debug-on-error t)

;;------------------------------
;; 便利マクロ
;;

;; リストの先頭に追加
;;(defmacro push (elm list)
;;  "ELM を LIST の先頭に追加"
;;  (list 'setq list (list 'cons elm list)))

;;------------------------------
;; Exec Path の設定
;;
;(push (expand-file-name "~/bin") exec-path)
;(push (expand-file-name "/usr/local/mh") exec-path)
;(push (expand-file-name "/usr/gnu/bin") exec-path)

;;------------------------------
;; Load Path の設定
;;
(push (expand-file-name "~akashi/lib/lisp") load-path)
;; for CentOS Japanese Environment
(push "/usr/local/share/emacs/site-lisp/anthy/" load-path)

;;;------------------------------
;;; 言語/文字コード体系
;;;
(set-language-environment "Japanese")

(prefer-coding-system 'euc-japan)
;(set-default-coding-systems 'euc-japan)
;(set-buffer-file-coding-system 'euc-japan t)
;(set-keyboard-coding-system 'euc-japan)

(if (not window-system)
    (set-terminal-coding-system 'euc-japan))


(partial-completion-mode 1)	; 賢い completion
(transient-mark-mode 0)		; リージョンをハイライトしない
(global-font-lock-mode)

(if (not window-system)
    (progn
      (load "term/vt100")		; vt100 で初期化
      (menu-bar-mode nil)))		; メニューなし

;;;------------------------------
;;; emacs-21.x のみ
;;;
(if (eq (string-to-int emacs-version) 21)
    (progn
      (setq recursive-load-depth-limit nil)
      ))

;;------------------------------
;; 各種設定
;;
(line-number-mode t)		; 行番号表示モード
(column-number-mode t)		; カラム位置表示モード
(icomplete-mode 1)		; completion 時に全エントリを表示する
;;(resize-minibuffer-mode 1)	; ミニバッファのサイズを可変に
(auto-compression-mode 1)	; 圧縮ファイルを自動圧伸
(setq
 scroll-step 1			; もはや1行スクロールも可能なくらい速いだろ
 gc-cons-threshold 600000	;ガーベージコレクション
 make-backup-files nil		; バックアップファイルを作らない
 next-line-add-newlines nil	; 最終行を追加しない
 mouse-yank-at-point t		; マウス位置でなくポインタ位置に yank する
 blink-matching-paren t		; 対応する括弧をチェック
 visible-bell t			; ピッピッとうるさいからな
 kill-whole-line t		; 行頭の C-k で行全体を消すようにする
 read-quoted-char-radix 16	; クオート文字は16進がよい
 find-file-existing-other-name t ; sym-link など同じ実体を編集時に警告
 frame-title-format (concat "%b - " (user-login-name) "@" (system-name))
				; フレームタイトル
 user-mail-address "akashi@ccm.canon.co.jp"
				; メールアドレス
 browse-url-browser-function 'browse-url-netscape
				; URLブラウズ時は Netscape で閲覧する
 auto-save-list-file-name nil	; .save-pid-domain-name~ を作らない
 auto-save-list-file-prefix nil	; これも .save...
 )


;;------------------------------
;; 画面/キー設定
;;
(global-unset-key "\C-h")
(global-set-key "\C-h" 'delete-backward-char)
;;(load "term/bobcat")		; DEL <--> ^H

;;------------------------------
;; その他キーバインド
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
;; キーアサイン
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
					; Utility に対するキーアサイン
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
					; カスタム関数に対するキーアサイン
					;
(global-set-key "\M-\C-l" 'switch-to-other-buffer)
(global-set-key "\M-q" 'cursor-top-of-screen)
(global-set-key "\C-x!" 'recenter-line-top-of-screen)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xl" 'goto-line)
					;
					; C-sig へのキーアサイン
					;

;;------------------------------
;; ファイルの先頭が「#!」なら保存時に実行パーミッションを設定
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
;; テンプレート
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
;(load "hira")				; 独自のローマ字→ひらがな変換
;(load "egg-keymap")			; Sunファンクションキー対応
(setq enable-double-n-syntax t)		; 「nn」を「ん」にする
(setq use-kuten-for-period t)		; "ピリオド" を「。」にする
(setq use-touten-for-comma nil)		; "カンマ" を「、」にしない
;; キー設定
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
;; Supercite: 自分用の引用ヘッダ
;;
(defun convert-date-string-j-mail (date)
  "メールの日付を日本語に変換する"
  (let (year month day week hour min sec tz)
    (string-match "^ *\\([A-Z][a-z][a-z]\\),? +\\([0-9]+\\) +\\([A-Z][a-z][a-z]\\) +\\([0-9]+\\) +\\([0-9]+\\):\\([0-9]+\\):\\([0-9]+\\) +\\([^ ]+\\) *$" date)
    (setq week
	  (cdr (assoc
		(substring date (match-beginning 1) (match-end 1))
		'(("Sun" . "日") ("Mon" . "月") ("Tue" . "火") ("Wed" . "水")
		  ("Thu" . "木") ("Fri" . "金") ("Sat" . "土") ("" . "") ))))
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
     (format "'%02d年%02d月%02d日(%s)%02d時%02d分(%s)"
	     year month day week hour min tz)))

;;------------------------------
;; xcite
;;
(autoload 'xcite "xcite" "Exciting cite" t)
(autoload 'xcite-yank-cur-msg "xcite" "Exciting cite" t)
(defun xcite-my-header ()
  "日本語での引用"
  (if (string-match "jp$" id)
      (format "\%sさんの%s頃のメール:\n"
	      (if (string< "" tag) (concat "『" tag "』") "")
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
   (setq x-face-inhibit-loadup-splash t	; x-face のスプラッシュ画面のパス
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
;; もうつかわないでしょう
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
;	      ;; ドメインコンプリーション用リスト
;	      mew-mail-domain-list '("canon.co.jp"	; 先頭は自分のドメイン
;				     "ccm.canon.co.jp"
;				     "pure.cpdc.canon.co.jp"
;				     "boarderz.com"
;				     "cts.canon.co.jp"
;				     "osawa.csl.sony.co.jp")
;	      ;; フォルダリストファイルを使用
;	      mew-use-folders-file-p t
;	      ;; from
;	      mew-from "Keisuke Mitani <mitani.keisuke@canon.co.jp>"
;	      mew-from-list '("Keisuke Mitani <keisuke@cse.canon.co.jp>"
;			      "Keisuke Mitani <keisuke@ccm.canon.co.jp>"
;			      "Keisuke Mitani <keisuke@boarderz.com>")
;	      ;; Summary Buffer is ~/
;	      mew-summary-trace-directory nil
;	      ;; デモ表示
;	      mew-demo nil
;	      ;; バックアップ
;	      mew-fcc nil
;	      ;; Reply-To
;	      mew-reply-to nil
;	      ;; emacs-20.x 使用時にヘッダの日本語入力を可能にする
;	      ;;mew-use-overlay-keymap nil
;	      ;; アイコン
;	      mew-icon-directory (expand-file-name "~/lib/mew/etc")
;	      ;;
;	      mew-field-other-visible nil
;	      ;; pgp
;	      mew-header-alist
;	      '(("X-PGP-Fingerprint:" .
;		 "37 85 33 D4 33 D4 3A 68  F8 DC 72 ED B9 C8 75 0F"))
;	      ;; 引用
;	      mew-cite-fields '("From:" "Date:")
;	      mew-cite-format "『%s』さんからの %s 頃のメール:\n"
;	      mew-cite-prefix "> "
;	      ;; [End of message] を消す
;	      ;;mew-end-of-message-string nil
;	      ;;mew-end-of-part-string nil
;	      ;; リファイル先を明示的に指定
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
;(setq gnus-background-mode 'dark)	;バックグランドを黒にした時のカラー
(setq user-full-name "Masa-Michi Akashi")
(setq gnus-default-article-saver 'gnus-summary-save-in-file)
(setq gnus-use-long-file-name nil)
(add-hook 'gnus-select-group-hook
	  '(lambda ()
	     (setq gnus-auto-select-first nil) ;最初を自動的にセレクトしない
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
; Solaris でのエラーをなくす
(setq dired-load-hook '
      (lambda()
        (setq dired-move-to-filename-regexp  "\\(Jan\\|Feb\\|Mar\\|Apr\\|May\\|Jun\\|Jul\\|Aug\\|Sep\\|Oct\\|Nov\\|Dec\\|1月\\|2月\\|3月\\|4月\\|5月\\|6月\\|7月\\|8月\\|9月\\|10月\\|11月\\|12月\\)[ ]+[0-9]+日?[ ]+\\([0-9][0-9]:[0-9][0-9]\\|[0-9][0-9][0-9][0-9]年?\\) ")))

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
      bbdb-use-pop-up nil		;; ポップアップ表示
      bbdb-pop-up-target-lines 0	;; BBDB windowの高さ
      bbdb/mail-auto-create-p   'bbdb-ignore-some-messages-hook
      bbdb-ignore-some-messages-alist
      '(("From" .       "MAILER-DAEMON\\|iso-2022-jp\\|ISO-2022-JP"))
      bbdb-pop-up-elided-display        '(creation-date timestamp)
      bbdb-user-mail-names      "akashi@ccm\\.canon\\.co\\.jp"
;      signature-use-bbdb t
      )

;; 終了時に「bbdb database を save するか」と聞くのがうざいのでやめる
(add-hook 'bbdb-after-change-hook
          '(lambda (dummy) (bbdb-save-db nil)))

;; 自動的に ML フィールドを加える
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
; その他の設定は ~/.wl

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
  "prom-wl を起動するが，必要なら mime-setup を読み込む"
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
		   '(prefix-register-verbose "さん:\n"))))

;; "三谷さん>"と cite してきた時の「さん」を取る
(add-hook 'mu-cite/pre-cite-hook
          '(lambda ()
             (save-excursion
               (goto-char (point-min))
               (replace-regexp "^\\(赤司\\|あかし\\)\\(さん\\|氏\\)>" "赤司>")
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
(setq sig-replace-string t	; 文字列置き換え
      sig-insert-end t		; mail末に signature 挿入
      sig-purge t		; 行末の空白行の削除
      sig-separator "--\n"	; signature のセパレータ
      sig-save-to-sig-name-alist t ; 選択した signature を db に保存
      sig-default "out\n"	; デフォルトの signature
      sig-save-file-every-change t ; db を常に保存
      sig-make-backup nil)	; db のバックアップを作るか
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
(setq dired-listing-switches "-alF")	; ls に渡すスイッチ
(setq dired-ls-F-marks-symlinks nil)	; ls -lF でs-linkに「@」が付くか

;;------------------------------
;; look
;;
;(autoload 'look-here "look" nil t nil)
;(global-set-key "\M-L" 'look-here)

;;------------------------------
;; keisen-mode
;;
(autoload 'keisen-mode "keisen-mule" "keisen: Enhanced Picture Mode." t)
(setq next-line-add-newlines nil)	;最終行を追加しない

;;------------------------------
;; h2v
;;
(autoload 'h2v-region "h2v" "領域を縦書きにします。" t)
(autoload 'h2v-buffer "h2v" "バッファ全体を縦書きにします。" t)

;;------------------------------
;; migemo - インクリメンタルサーチ日本語対応
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
;(defvar dserver-host-name "slume2") ; dserver が動いているホスト
;(defvar od:*window-config* 6)     ; 候補を表示するウインドウの行数+1
;(defvar od:*body-fillcolumn* nil) ; 説明を表示する時の最大幅 通常はnilでよい
;(defvar od:*select-unique-entry-immediately* t) ; 候補が1つならいきなり表示
;(defvar od:*scroll-step* 'half)   ; 説明文をスクロールする時のステップ
;(defvar od:*default-jisyo* nil)   ; デフォルト辞書(nil,"kojien","eiwa","waei")
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
(setq TRR:return-is-space t		; return キーを space で代用
      TRR:japanese t			; メッセージは日本語
      TRR:ding-when-miss nil		; miss しても音を鳴さない
      TRR:un-hyphenate nil)		; ハイフネーションなし

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
;	  ;;どこにいてもインデント
;	  c-tab-always-indent nil
;	  ;; 関数の引数宣言のインデント量
;	  c-argdecl-indent 2
;	  ;; {と}で囲まれた関数本体のインデント量
;	  c-indent-level 4
;	  ;; ifなどとそれに続くステートメントのインデント量
;	  c-continued-statement-offset 4
;	  ;; {に続くステートメントのインデント量
;	  c-continued-brace-offset 4
;	  ;; for文などの{のインデント量
;	  c-brace-offset -4
;	  ;; ラベルやcase文などをインデントレベルからずらす量
;	  c-label-offset -2
;	  ;; ブロック本体のインデント量
;	  c-brace-imaginary-offset 0
;	  ;; コメントのインデント量
;	  comment-colum 40
;	  ;; {に対応する}を表示する。
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
;; 対応括弧の表示
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
	      perl-tab-always-indent nil	; 行中のTABはTAB文字として...
	      perl-indent-level 4		; インデント/行の続きは4タブ
	      perl-continued-statement-offset 4
	      perl-continued-brace-offset 4
	      perl-brace-offset 0
	      perl-brace-imaginary-offset 0
	      perl-label-offset 0		; ラベルをインデントしない
	      )))
(add-hook 'cperl-mode-hook
	  '(lambda ()
	     (setq
	      cperl-tab-always-indent nil	; 行中のTABはTAB文字として...
	      cperl-indent-level 4		; インデント/行の続きは4タブ
	      cperl-continued-statement-offset 4
	      cperl-continued-brace-offset 4
	      cperl-brace-offset 0
	      cperl-brace-imaginary-offset 0
	      cperl-label-offset 0		; ラベルをインデントしない

	      ;cperl-hairy t			; 身の毛もよだつような...?!
	      cperl-help t
;;	      (define-key cperl-mode-map "\C-h" 'backward-delete-char)
	      )))
;ファイルセーブ時に実行ファイルにする
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
	     ;; Netscape 拡張
	     (load-library "hhm-netscape")
	     ;; TABLE 拡張
	     (load-library "tables"))))

(add-hook 'html-helper-mode-hook
	  (lambda ()
	    ;; 漢字コードの設定
;	    (set-buffer-file-coding-system 'iso-2022-jp)
	    ;; outlineモード対応
;;	    (outline-minor-mode t)
	    (make-local-variable 'outline-regexp)
	    (setq outline-regexp "<[Hh][1-6]*>")
	    ;; compileコマンドで htmllint を起動
	    (define-key html-helper-mode-map "\C-c\C-c" 'compile)
	    (make-local-variable 'compile-command)
	    (setq compile-command (concat "htmllint " buffer-file-name))))
	     
(setq
 ;; タイムスタンプを自動更新
 html-helper-do-write-file-hooks t
 ;; 新ファイルスケルトン挿入
 html-helper-build-new-buffer t
 ;; デフォルトメールアドレス
 html-helper-address-string
 "<A HREF=\"mailto:akashi@ccm.canon.co.jp\">Masa-Michi Akashi</A>"
 ;; 新規バッファ用テンプレート
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
  "日本語の更新時間を挿入する"
  (require 'time-stamp)
  ;; 漢字コードの設定
  (set-buffer-file-coding-system 'iso-2022-jp)
  (insert "最終更新: " (time-stamp-yyyy/mm/dd) " "
	  (nth 1 (current-time-zone)) "\n"))

(defun html-helper-keisuke-insert-timestamp-e ()
  "英語の更新時間を挿入する"
  (require 'time-stamp)
  ;; 漢字コードの設定
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

;; outline-modeの代りに Allout outline mode を使う
(require 'allout)
;;(outline-init t)

;;------------------------------
;; ちっちゃな便利関数
;;
(defun scroll-one-line-up (&optional arg)
  "カレントバッファを1(N)行スクロールUPする。"
  (interactive "p")
  (scroll-up (or arg 1)))

(defun scroll-one-line-down (&optional arg)
  "カレントバッファを1(N)行スクロールDOWNする。"
  (interactive "p")
  (scroll-down (or arg 1)))

(defun cursor-top-of-screen (&optional arg)
  "カーソルをカレントバッファの画面上の1(N)行目に移動する。"
  (interactive "p")
  (move-to-window-line (or arg 1)))

(defun previous-window-line (n)
  "画面上での1行前に移動する"
  (interactive "p")
  (let ((cur-col
         (- (current-column)
            (save-excursion (vertical-motion 0) (current-column)))))
    (vertical-motion (- n))
    (move-to-column (+ (current-column) cur-col))))

(defun next-window-line (n)
  "画面上での1行次に移動する"
  (interactive "p")
  (let ((cur-col
         (- (current-column)
            (save-excursion (vertical-motion 0) (current-column)))))
    (vertical-motion n)
    (move-to-column (+ (current-column) cur-col))))

(defun switch-vertical-move-style (&optional arg)
  "C-p, C-n で移動するのを画面上の1行単位にする。
引数が与えられたら通常のemacsと同じように論理行単位に移動するようになる。"
  (interactive "P")
  (if arg
    (global-set-key "\C-p" 'previous-line)
    (global-set-key "\C-p" 'previous-window-line))
  (if arg
    (global-set-key "\C-n" 'next-line)
    (global-set-key "\C-n" 'next-window-line)))

(defun change-tab-width (&optional width)
  "Tab幅を8⇔4と切り替える。
引数が与えられたらその値にセットする。"
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
;; man の日本語対応
;;
(setq
 Man-see-also-regexp "SEE ALSO|関連項目"	; SEE ALSO の項目を補完
 Man-first-heading-regexp			; 先頭ヘッダ
 "^[ \t]*NAME$\\|^[ \t]*【*名[前称]】*$\\|^[ \t]*No manual entry fo.*$"
 Man-heading-regexp				; ヘッダ
 "^\\([A-Zーぁ-んァ-ヶ亜-瑤【][A-Zーぁ-んァ-ヶ亜-瑤】 \t]+\\)$")

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
      '((holiday-fixed  1  1 "元旦")
	(holiday-fixed  1 15 "成人の日")
	(holiday-fixed  2 11 "建国記念日")
	(holiday-fixed  4 29 "みどりの日")
	(holiday-fixed  5  3 "憲法記念日")
	(holiday-fixed  5  4 "国民の祝日")
	(holiday-fixed  5  5 "こどもの日")
	(holiday-fixed  7 20 "海の日")
	(holiday-fixed  9 15 "敬老の日")
	(holiday-fixed 10 10 "体育の日")
	(holiday-fixed 11  3 "文化の日")
	(holiday-fixed 11 23 "勤労感謝の日")
	(holiday-fixed 12 23 "天皇誕生日"))
      solar-n-hemi-seasons
      '("春分の日" "夏至(休日じゃない)" "秋分の日" "冬至夏至(休日じゃない)"))
;; 必要のない海外の祝日を表示しないようにする
(setq all-christian-calendar-holidays nil
      general-holidays nil
      christian-holidays nil
      hebrew-holidays nil
      islamic-holidays nil
      oriental-holidays nil
      solar-holidays t)

;;;------------------------------
;;; カスタマイズ
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
