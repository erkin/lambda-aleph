(use intarweb http-client medea)
(import webhook-secrets)
(use uri-common)

(define project-url "https://github.com/erkin/lambda-aleph")
(define project-version "0.0.3")

;; Bot's user agent
;; https://discordapp.com/developers/docs/reference#user-agent
;;
;; Discord doesn't recognise the version string and wants it to be incorporated
;; in the system information section, so we're leaving the version string blank
;; and appending it to our project URL
(client-software (list (list "DiscordBot" #f (string-append project-url ", " project-version))))

(define payload (json->string '((content . "one two three"))))

;; webhook-uri is the URI string containing id and token
;; defined in the webhook-secrets module
(with-input-from-request
 (make-request method: 'POST
               uri: webhook-uri
               headers: (headers '((content-type application/json))))
 payload
 print)
