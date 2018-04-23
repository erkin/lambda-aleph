(module webhook (webhook-uri webhook-payload webhook-send)
  (import chicken scheme)
  (import webhook-secrets project)
  (use intarweb http-client medea uri-common)
  
  (define webhook-uri
   (uri-reference
    (string-append "https://canary.discordapp.com/api/webhooks/"
                   webhook-id "/" webhook-token)))

  ;; We can send a bunch of stuff over JSON
  ;; https://discordapp.com/developers/docs/resources/webhook#execute-webhook
  ;;
  ;; We're only sending commandline arguments directly to the channel
  ;; for the time being
  (define (webhook-payload content)
    (json->string (list (cons 'content content)
                        (cons 'username project-name))))

  (define (webhook-send uri payload)
    (with-input-from-request
     (make-request method: 'POST
                   uri: uri
                   headers: (headers '((content-type application/json))))
     payload
     print)))
