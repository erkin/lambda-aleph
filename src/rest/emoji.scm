(module λℵ-rest-emoji *
  (import chicken scheme)
  (import λℵ-rest)
  
;;; This file implements the `emoji` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/emoji

;;; See channel.scm for docstring reference.

  (define (list-guild-emojis guild-id)
    (rest-request
     request: 'GET sub-uri: (string-append "/guilds/" guild-id "/emojis")))

  (define (get-guild-emoji guild-id emoji-id)
    (rest-request
     request: 'GET sub-uri: (string-append "/guilds/" guild-id
                                           "/emojis/" emoji-id)))

  (define (create-guild-emoji guild-id query)
    (rest-request
     request: 'POST sub-uri: (string-append "/guilds/" guild-id)
     query: query))

  (define (modify-guild-emoji guild-id emoji-id query)
    (rest-request
     request: 'PATCH sub-uri: (string-append "/guilds/" guild-id
                                             "/emojis/" emoji-id)
     query: query))

  (define (delete-guild-emoji guild-id emoji-id)
    (rest-request
     request: 'DELETE sub-uri: (string-append "/guilds/" guild-id
                                              "/emojis/" emoji-id))))
