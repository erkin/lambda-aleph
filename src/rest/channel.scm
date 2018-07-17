(module λℵ-rest-channel *
  (import chicken scheme)
  (import λℵ-rest)
  
;;; This file implements the `channel` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/channel

;;; Documentation format:
  
;;; PERMISSION [OPTIONAL_PERMISSION]
;;; query_value (query-values) [optional_query_value] [(optional_query_values)]
;;; return_value (return_values)
  
;;; Fields marked with ? indicates that the official API documentation does not
;;; state anything about them. I'll try to find them out experimentally.
  
;;; `query` is an alist to be converted into a JSON string.
;;; You can pass #f as `query` if all values are optional.
;;; This does not apply to `post-channel-invite` which
;;; requires an empty JSON body at least.

;;; The order of procedures is: GET POST PUT PATCH DELETE

  ;;
  ;;
  ;; channel
  (define (get-channel channel-id)
    (rest-request
     request: 'GET sub-uri: (string-append "/channels/" channel-id)))

  ;; MANAGE_CHANNELS
  ;; name position topic nsfw bitrate user_limit permission_overwrites parent_id
  ;; channel
  (define (put-channel channel-id query)
    (rest-request
     request: 'PUT sub-uri: (string-append "/channels/" channel-id)
     query: query))

  ;; MANAGE_CHANNELS
  ;; [name] [position] [topic] [nsfw] [bitrate] [user]_[limit] [permission_overwrites] [parent_id]
  ;; channel
  (define (patch-channel channel-id query)
    (rest-request
     request: 'PATCH sub-uri: (string-append "/channels/" channel-id)
     query: query))

  ;; MANAGE_CHANNELS
  ;;
  ;; channel
  (define (delete-channel channel-id)
    (rest-request
     request: 'DELETE sub-uri: (string-append "/channels/" channel-id)))


  ;; READ_MESSAGE_HISTORY
  ;;
  ;; message
  (define (get-message channel-id message-id)
    (rest-request
     request: 'GET sub-uri: (string-append "/channels/" channel-id
                                           "/messages/" message-id)))

  ;; READ_MESSAGE_HISTORY
  ;; [around] [before] [after] [limit]
  ;; (message)
  (define (get-messages channel-id query)
    (rest-request
     request: 'GET sub-uri: (string-append "/channels/" channel-id
                                           "/messages")
     query: query))

  ;; SEND_MESSAGES [SEND_TTS_MESSAGES]
  ;; content [nonce] [tts] [file] [embed] [payload_json]
  ;; message
  (define (post-message channel-id query)
    (rest-request
     request: 'POST sub-uri: (string-append "/channels/" channel-id
                                            "/messages")
     query: query))

  ;; ?
  ;; content [embed]
  ;; message
  (define (patch-message channel-id message-id query)
    (rest-request
     request: 'PATCH sub-uri: (string-append "/channels/" channel-id
                                             "/messages/" message-id)
     query: query))

  ;; MANAGE_MESSAGES
  ;;
  ;;
  (define (delete-message channel-id message-id)
    (rest-request
     request: 'DELETE sub-uri: (string-append "/channels/" channel-id
                                              "/messages/" message-id)))


  ;; MANAGE_MESSAGES
  ;; (message)
  ;;
  (define (post-bulk-deletion channel-id query)
    (rest-request
     request: 'POST sub-uri: (string-append "/channels/" channel-id
                                            "/messages/bulk-delete")
     query: query))


  ;; ?
  ;;
  ;; (message)
  (define (get-pinned-messages channel-id)
    (rest-request
     request: 'GET sub-uri: (string-append "/channels/" channel-id
                                           "/pins")))

  ;; MANAGE_MESSAGES
  ;; 
  ;; message
  (define (put-pinned-message channel-id message-id)
    (rest-request
     request: 'PUT sub-uri: (string-append "/channels/" channel-id
                                           "/pins/" message-id)))
 
  ;; MANAGE_MESSAGES
  ;;
  ;;
  (define (delete-pinned-message channel-id message-id)
    (rest-request
     request: 'DELETE sub-uri: (string-append "/channels/" channel-id
                                              "/pins/" message-id)))


  ;;
  ;; [before] [after] [limit]
  ;; (user)
  (define (get-reactions channel-id message-id emoji query)
    (rest-request
     request: 'GET
     sub-uri: (string-append: "/channels/" channel-id
                              "/messages/" message-id "/reactions/" emoji)))

  ;; READ_MESSAGE_HISTORY [ADD_REACTIONS]
  ;;
  ;;
  (define (put-reaction channel-id message-id emoji)
    (rest-request
     request: 'PUT
     sub-uri: (string-append "/channels/" channel-id
                             "/messages/" message-id "/reactions/" emoji "/@me")))

  ;; [MANAGE_MESSAGES]
  ;;
  ;;
  (define (delete-reaction channel-id message-id user-id emoji)
    ;; user-id = "", emoji = "" -> all
    ;; user-id = "@me" -> own
    (rest-request
     request: 'DELETE
     sub-uri: (string-append "/channels/" channel-id
                             "/messages/" message-id "/reactions/" emoji "/" user-id)))


  ;; MANAGE_ROLES
  ;; allow deny type
  ;;
  (define (put-channel-permission channel-id overwrite-id query)
    (rest-request
     request: 'PUT sub-uri: (string-append "/channels/" channel-id
                                           "/permissions/" overwrite-id)
     query: query))

  ;; MANAGE_ROLES
  ;;
  ;;
  (define (delete-channel-permission channel-id overwrite-id)
    (rest-request
     request: 'DELETE sub-uri: (string-append "/channels/" channel-id
                                              "/permissions/" overwrite-id)))


  ;; MANAGE_CHANNELS
  ;;
  ;; (invite)
  (define (get-channel-invites channel-id)
    (rest-request
     request: 'GET sub-uri: (string-append "/channels/" channel-id
                                           "/invites")))

  ;; CREATE_INSTANT_INVITES
  ;; [max_age] [max_uses] [temporary] [unique]
  ;; invite
  (define (post-channel-invite channel-id query)
    (rest-request
     request: 'POST sub-uri: (string-append "/channels/" channel-id
                                            "/invites")
     query: query))


  ;;
  ;;
  ;;
  (define (post-typing channel-id)
    (rest-request
     request: 'POST sub-uri: (string-append "/channels/" channel-id
                                            "/typing")))


  ;;
  ;; access_token nick
  ;; ?
  (define (put-group-user channel-id user-id query)
    (rest-request
     request: 'PUT sub-uri: (string-append "/channels/" channel-id
                                           "/recipients/" user-id)
     query: query))

  ;;
  ;;
  ;; ?
  (define (delete-group-user channel-id user-id)
    (rest-request
     request: 'DELETE sub-uri: (string-append "/channels/" channel-id
                                              "/recipients/" user-id))))
