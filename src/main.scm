(use args http-client system)
(include "config")
(include "websockets")
(include "channel")
(include "webhooks")
(import λℵ-project λℵ-secrets λℵ-sockets λℵ-hooks)
(import λℵ-channel) ; + rest

(define opts
  (list
   (args:make-option (h help) #:none "Print this help message"
                     (usage))
   (args:make-option (v version) #:none "Display version"
                     (print project-name " v" project-version))
   (args:make-option (s send) (required: "STRING")
                     "Post STRING to the test channel through webhook"
                     (webhook-send-string arg))
   (args:make-option (g get) (required: "CHANNEL-ID")
                     "GET channel CHANNEL-ID"
                     (get-channel arg))))

(define (usage)
  (print "Usage: " (car (argv)) " [OPTIONS]")
  (newline)
  (print (args:usage opts)))

(define (webhook-send-string arg)
  (send-webhook-request-with-json
   webhook-uri
   'POST
   (make-webhook-payload arg))
  (print "Sent: " arg))

;; Bot's user agent
;; https://discordapp.com/developers/docs/reference#user-agent
;;
;; Discord doesn't recognise the version string and wants it to be incorporated
;; in the system information section, so we're leaving the version string blank
;; and appending it to our project URL
(define (main args)
  (client-software
   `(,'("DiscordBot" #f (string-append project-url ", " project-version))))
  (if (null? args) (usage) (args:parse args opts)))

(main (command-line-arguments))
