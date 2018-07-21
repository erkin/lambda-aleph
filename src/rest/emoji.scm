(module λℵ-rest-emoji *
  (import chicken scheme)
  (import λℵ-rest)
  (use (only uri-common make-uri))
  
;;; This file implements the `emoji` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/emoji

;;; See channel.scm for docstring reference.

  ;; MANAGE_EMOJIS
  ;;
  ;; (emoji)
  (define (get-emojis guild-id)
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("guilds" ,guild-id "emojis"))))

  ;; MANAGE_EMOJIS
  ;;
  ;; emoji
  (define (get-emoji guild-id emoji-id)
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("guilds" ,guild-id "emojis" ,emoji-id))))

  ;; MANAGE_EMOJIS
  ;; name image roles
  ;; emoji
  (define (post-emoji guild-id query)
    (rest-request
     request: 'POST
     sub-uri: (make-uri path: `("guilds" ,guild-id))
     query: query))

  ;; MANAGE_EMOJIS
  ;; name roles
  ;; emoji
  (define (patch-emoji guild-id emoji-id query)
    (rest-request
     request: 'PATCH
     sub-uri: (make-uri path: `("guilds" ,guild-id "emojis" ,emoji-id))
     query: query))

  ;; MANAGE_EMOJIS
  ;;
  ;;
  (define (delete-emoji guild-id emoji-id)
    (rest-request
     request: 'DELETE
     sub-uri: (make-uri path: `("guilds" ,guild-id "emojis" ,emoji-id)))))
