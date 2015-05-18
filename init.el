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
; サービスの設定
(setq url-proxy-services
      `(("http" . ,proxy-server-string)
	("https" . ,proxy-server-string)))
; パスワード設定関数の定義
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
 user-mail-address "akashi.masamichi@canon.co.jp"
				; メールアドレス
; browse-url-browser-function 'browse-url-netscape
				; URLブラウズ時は Netscape で閲覧する
 auto-save-mode nil ; Turn off auto save
 auto-save-list-file-name nil	; .save-pid-domain-name~ を作らない
 auto-save-list-file-prefix nil	; これも .save...
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
;; イタリックやボールドフォントを標準フォントから作成する
(setq w32-enable-synthesized-fonts t)

;;
;; #!がファイルの先頭にあったら実行権を付与する
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
