(use args http-client)
(import sockets rest webhook)
(import project secrets)

(define opts
  (list
   (args:make-option (h help) #:none "Print this help message"
                     (usage))
   (args:make-option (v version) #:none "Display version"
                     (version))
   (args:make-option (s send) (required: "STRING")
                     "Post STRING to channel through webhook"
                     (webhook-send-string arg))))

(define (usage)
  (print "Usage: " (car (argv)) " [OPTIONS]")
  (newline)
  (print (args:usage opts)))

(define (version)
  (print project-name " v" project-version))

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
(client-software
 (list (list "DiscordBot" #f (string-append project-url ", " project-version))))

(receive (options operands)
    (args:parse (command-line-arguments) opts)
  (if (null? (command-line-arguments))
      (usage)
      (exit)))
