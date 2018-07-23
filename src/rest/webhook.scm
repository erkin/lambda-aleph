(module λℵ-rest-webhook *
  (import chicken scheme)
  (import λℵ-rest)
  (use (only uri-common make-uri))
  
;;; This file implements the `webhook` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/webhook

;;; See channel.scm for docstring reference.

  ;; MANAGE_WEBHOOKS
  ;; name avatar
  ;; webhook
  (define (post-webhook channel-id query)
    (rest-request
     request: 'POST
     sub-uri: (make-uri path: `("channels" ,channel-id "webhooks"))
     query: query))

  ;; MANAGE_WEBHOOKS
  ;;
  ;; (webhooks)
  (define (get-channel-webhooks channel-id)
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("channels" ,channel-id "webhooks"))))

  ;; MANAGE_WEBHOOKS
  ;;
  ;; (webhooks)
  (define (get-guild-webhooks guild-id)
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("webhooks" ,guild-id "webhooks"))))

  ;; MANAGE_WEBHOOKS
  ;;
  ;; webhook
  (define (get-webhook webhook-id)
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("webhooks" ,webhook-id))))

  ;; MANAGE_WEBHOOKS
  ;;
  ;; webhook
  (define (get-webhook-token webhook-id webhook-token)
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("webhooks" ,webhook-id ,webhook-token))))

  ;; MANAGE_WEBHOOKS
  ;; name avatar channel_id
  ;; webhook
  (define (patch-webhook webhook-id)
    (rest-request
     request: 'PATCH
     sub-uri: (make-uri path: `("webhooks" ,webhook-id))))

  ;; MANAGE_WEBHOOKS
  ;;
  ;; webhook
  (define (patch-webhook-token webhook-id webhook-token)
    (rest-request
     request: 'PATCH
     sub-uri: (make-uri path: `("webhooks" ,webhook-id ,webhook-token))))

  ;; MANAGE_WEBHOOKS
  ;;
  ;;
  (define (delete-webhook webhook-id)
    (rest-request
     resuest: 'DELETE
     sub-uri: (make-uri path: `("webhooks" ,webhook-id))))

  ;; MANAGE_WEBHOOKS
  ;;
  ;;
  (define (delete-webhook-token webhook-id webhook-token)
    (rest-request
     request: 'DELETE
     sub-uri: (make-uri path: `("webhooks" ,webhook-id ,webhook-token))))

  ;; MANAGE_WEBHOOKS
  ;; content|file|embeds [username] [avatar_url] [tts] [file]
  ;;
  (define (post-execute-webhook webhook-id webhook-token query #!key (wait #f))
    (rest-request
     request: 'POST
     sub-uri: (make-uri path: `("webhooks" ,webhook-id ,webhook-token)
                        query: `(wait . ,wait))
     query: query))

  ;; MANAGE_WEBHOOKS
  ;;
  ;;
  (define (post-execute-webhook-slack webhook-id webhook-token #!key (wait #f))
    (rest-request
     request: 'POST
     sub-uri: (make-uri path: `("webhooks" ,webhook-id ,webhook-token "slack")
                        query: `(wait . ,wait))))

  ;; MANAGE_WEBHOOKS
  ;;
  ;;
  (define (post-execute-webhook-github webhook-id webhook-token #!key (wait #f))
    (rest-request
     request: 'POST
     sub-uri: (make-uri path: `("webhooks" ,webhook-id ,webhook-token "github")
                        query: `(wait . ,wait))))
  )
