#!/usr/bin/csi -s
(include "config")
(include "secret")
(include "text")
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

(use args http-client readline utf8)
(import λℵ-project λℵ-secret λℵ-sockets λℵ-text)
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
                     (print-usage))
   (args:make-option (v version) #:none "Display version"
                     (print project-name " v" project-version))
   (args:make-option (i repl) #:none "Start REPL"
                     (repl-start))))

(define (print-usage)
  (print "Usage: " (car (argv)) " [OPTIONS]")
  (newline)
  (print (args:usage opts))
  (exit))

(define (repl-start)
  (define (repl-read)
    (let ((line (read-line)))
      (cond ((eof-object? line)
             (exit))
            (else
             (print " " (tint line 'red)))))
    (repl-read))
  (print-banner)
  (current-input-port
   (make-readline-port (tint "ɩ " 'green)
                       (tint " υ " 'yellow)))
  (print "Type "
         (tint "help" 'green)
         " to see a list of commands.")
  (repl-read))

;;; Entry point
(if (null? (command-line-arguments))
    (print-usage)
    (args:parse (command-line-arguments) opts))
