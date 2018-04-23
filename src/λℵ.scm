(use args http-client srfi-13)
(import webhook project)

(define opts
  (list
   (args:make-option (h help) #:none "Print this help message"
                     (usage))
   (args:make-option (v version) #:none "Display version"
                     (print project-name project-version)
                     (exit))
   (args:make-option (s send) (required: "STRING")
                     "Post STRING to channel through webhook"
                     (send-arg arg))))

(define (usage)
 (with-output-to-port (current-error-port)
   (lambda ()
     (print "Usage: " (car (argv)) " [OPTIONS]")
     (newline)
     (print (args:usage opts))))
 (exit 1))

(define (send-arg arg)
  (webhook-send webhook-uri (webhook-payload arg)))

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
  (print "Sent: " (alist-ref 'send options)))
