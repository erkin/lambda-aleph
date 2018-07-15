(include "config")
(include "websockets")
(include "rest")
(include "rest/audit-log")
(include "rest/channel")
(include "rest/emoji")
(include "rest/guild")
(include "rest/invite")
(include "rest/user")
(include "rest/voice")
(include "rest/webhook")

(use args http-client system)
(import λℵ-project λℵ-secret λℵ-sockets)
(import λℵ-rest-channel)

(define (print-version)
  (print  project-name " v" project-version)
  (print  "Copyright (C) 2018 Erkin Batu Altunbaş")
  (newline)
  (print* "Each file of this project's source code is subject ")
  (print  "to the terms of the Mozilla Public Licence v2.0")
  (print* "If a copy of the MPL was not distributed with this file, ")
  (print  "you can obtain one at https://mozilla.org/MPL/2.0/")
  (exit))

(define opts
  (list
   (args:make-option (h help) #:none "Print this help message"
                     (usage))
   (args:make-option (v version) #:none "Display version"
                     (print project-name " v" project-version))))

(define (usage)
  (print "Usage: " (car (argv)) " [OPTIONS]")
  (newline)
  (print (args:usage opts)))

;;; Bot's user agent
;;; https://discordapp.com/developers/docs/reference#user-agent

;;; Discord doesn't recognise the version string and wants it to be incorporated
;;; in the system information section, so we're leaving the version string
;;; blank (#f) and appending it to our project URL instead.

(define (main args)
  (client-software
   `(,'("DiscordBot" #f (string-append project-url ", " project-version))))
  (if (null? args) (usage) (args:parse args opts)))

(main (command-line-arguments))
