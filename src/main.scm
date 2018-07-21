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
(import λℵ-rest-channel λℵ-rest-audit λℵ-rest-emoji
        λℵ-rest-guild λℵ-rest-invite λℵ-rest-user
        λℵ-rest-voice λℵ-rest-webhook)

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

(if (null? (command-line-arguments))
    (usage)
    (args:parse (command-line-arguments) opts))
