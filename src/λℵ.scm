(use intarweb uri-common http-client medea)

;; webhook-id and webhook-token are defined in secret.scm
(define uri
  (uri-reference
   (string-append "https://canary.discordapp.com/api/webhooks/"
                  webhook-id "/" webhook-token)))

(let ((url "https://github.com/erkin/lambda-aleph") (version "0.0.2"))
 (client-software '(((append-string "Discord-Bot (" url ", " version ")")))))

(with-input-from-request
 (make-request method: 'POST
               uri: uri
               headers: (headers '((content-type application/json))))
 (json->string '((content . "hello world")))
 print)
