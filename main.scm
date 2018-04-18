(use intarweb uri-common http-client medea)

;; put your webhook id and token here
(define uri
  (uri-reference
   (string-append "https://canary.discordapp.com/api/webhooks/" id "/" token)))

(with-input-from-request
 (make-request method: 'POST
               uri: uri
               headers: (headers '((content-type application/json))))
 (json->string '((content . "hello world")))
 print)

