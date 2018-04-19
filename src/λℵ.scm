(use intarweb http-client medea)
(import webhook-secrets)

(let ((url "https://github.com/erkin/lambda-aleph") (version "0.0.2"))
  (client-software
   '(((append-string "Discord-Bot (" url ", " version ")"))) version #f))

;; webhook-uri is the URI string containing id and token
;; defined in the webhook-secrets module
(with-input-from-request
 (make-request method: 'POST
               uri: webhook-uri
               headers: (headers '((content-type application/json))))
 (json->string '((content . "hello world")))
 print)
