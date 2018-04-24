(module webhook *
  (import chicken scheme)
  (import project rest secrets)
  (use intarweb http-client medea uri-common)
  
  ;; https://discordapp.com/developers/docs/resources/webhook

  (define webhook-uri
    (uri-reference
     (string-append api-uri "/webhooks/" secret-webhook-id "/" secret-webhook-token)))

  (define (make-webhook-payload content)
    (json->string `((content . ,content)
                    (username . ,project-name))))

  ;; request can be DELETE, GET, PATCH, POST, PUT
  (define (send-webhook-request uri request)
    (with-input-from-request
     (make-request method: request
                   uri: uri)
     #f
     current-output-port))

  (define (send-webhook-request-with-json uri request payload)
    (with-input-from-request
     (make-request method: request
                   uri: uri
                   headers: (headers '((content-type application/json))))
     payload
     current-output-port)))
