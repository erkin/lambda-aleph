(module webhook *
  (import chicken scheme)
  (import project rest secrets)
  (use intarweb http-client medea uri-common)
  
  ;; https://discordapp.com/developers/docs/resources/webhook

  ;; mode is either 'channel or 'guild
  ;; target is the alist id of said channel or guild, returning a snowflake id
  (define (get-guild-webhooks mode target)
    (send-webhook-request
     (uri-reference
      (if (string=? mode "guild")
          (string-append api-uri "/guilds/"
                         (cdr (assoc target guilds)) "/webhooks")
          (string-append api-uri "/channels/"
                         (cdr (assoc target channels)) "/webhooks"))) 'GET))

  (define (make-webhook-uri mode id #!optional token)
    (if (null? token)
        (uri-reference
         (string-append api-uri "/" mode "s/" id))
        (uri-reference
         (string-append api-uri "/" mode "s/" id "/" token))))

  (define (make-webhook-payload content)
    (json->string (list (cons 'content content)
                        (cons 'username project-name))))

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
