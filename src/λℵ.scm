(use intarweb http-client medea)
(import webhook-secrets)
(use uri-common)

(define project-url "https://github.com/erkin/lambda-aleph")
(define project-version "0.0.3")

;; Bot's user agent
;; https://discordapp.com/developers/docs/reference#user-agent
(client-software
 (list (list (string-append "DiscordBot (" project-url ", " project-version ")")
            project-version version #f)))

(define payload (json->string '((username . "bot test")
                                (content . "hello world"))))

;; webhook-uri is the URI string containing id and token
;; defined in the webhook-secrets module
(with-input-from-request
 (make-request method: 'POST
               uri: webhook-uri
               headers: (headers '((content-type application/json))))
 payload
 print)
