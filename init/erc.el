; Load it up
(require 'erc)
; Set some SSL stuff up...
(require 'tls)
(setq tls-program '("openssl s_client -connect %h:%p -no_ssl2 -ign_eof")
      autojoin-channels-alist '((".*\\.freenode.net" "#lisp" "#sbcl" "#concatenative" "#paktahn")
                                ("ircs.cmgdigital.com" "#all" "#clug" "#team6"))
      erc-autojoin-mode t
      erc-user-full-name "Brit Butler"
      znc-userpass "yeahright!:tryagainjerks"
      cmg-userpass "gmeno:gmeno"
      znc-serv "localhost"
      znc-port 8192)

; Highlighting and Matches
(setq erc-current-nick-highlight-type 'nick
      erc-pals '("persi" "lpolzer" "xach" "nyef"
                 "antifuchs" "nikodemus" "pkhuong"
                 "slava" "littledan")
      erc-keywords '("\\blunch\\b" "\\bcodereview\\b"
                     "\\bbrit\\b" "\\bredline\\b")
      erc-fools '())

; Logging
(pushnew 'log erc-modules)
(erc-update-modules)
(setq erc-log-channels t
      erc-log-channels-directory "~/Documents/logs/irc"
      erc-log-write-after-send t
      erc-log-write-after-insert t)

; Channel Tracking and Notifications
(setq erc-log-matches-types-alist '((keyword . "ERC Keywords")
                                    (current-nick . "ERC Nick Mentions"))
      erc-track-mode t
      erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE"))

(defun irc-work ()
  (interactive)
  (erc :server znc-serv :port znc-port :password cmg-userpass))

(defun irc-home ()
  (interactive)
  (erc-tls :server znc-serv :port znc-port :password znc-userpass))

(defun start-chat ()
   "Connect to IRC and Jabber accounts."
   (interactive)
   (erc-tls :server znc-serv :port znc-port :password znc-userpass)
   (erc-tls :server znc-serv :port znc-port :password cmg-userpass)
   (jabber-connect-all))
