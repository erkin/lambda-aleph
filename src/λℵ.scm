(use intarweb http-client medea uri-common srfi-13)
(import webhook-secrets) ; contains webhook-id and webhook-token

(define project-url "https://github.com/erkin/lambda-aleph")
(define project-version "0.0.4")

(define project-name "λℵ")

(define webhook-uri
  (uri-reference
   (string-append "https://canary.discordapp.com/api/webhooks/"
                  webhook-id "/" webhook-token)))

;; Bot's user agent
;; https://discordapp.com/developers/docs/reference#user-agent
;;
;; Discord doesn't recognise the version string and wants it to be incorporated
;; in the system information section, so we're leaving the version string blank
;; and appending it to our project URL
(client-software
 (list (list "DiscordBot" #f (string-append project-url ", " project-version))))

;; We can send a bunch of stuff over JSON
;; https://discordapp.com/developers/docs/resources/webhook#execute-webhook
;;
;; We send commandline arguments directly to the channel for the time being
(define webhook-payload
  (json->string (list (cons 'content (string-join (cdr (argv))))
                      (cons 'username project-name))))

(with-input-from-request
 (make-request method: 'POST
               uri: webhook-uri
               headers: (headers '((content-type application/json))))
 webhook-payload
 print)
