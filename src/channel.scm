(module λℵ-channel *
  (import chicken scheme)
  (use http-client intarweb uri-common medea)
  (import λℵ-config λℵ-secrets)
  
    ;;
  ;; -> channel
  (define (get-channel channel-id)
    (call-with-input-request
     (make-request method: 'GET
                   uri: (uri-reference (string-append api-uri "/channels/" channel-id))
                   headers: (headers auth))
     #f
     print))

  ;; MANAGE_CHANNELS
  ;; -> channel
  (define (put-channel channel-id query)
    #f)

  ;; MANAGE_CHANNELS
  ;; -> channel
  (define (patch-channel channel-id query)
    #f)

  ;; MANAGE_CHANNELS
  ;; -> channel
  (define (delete-channel channel-id)
    #f)

  ;; SEND_MESSAGES [SEND_TTS_MESSAGES]
  ;; -> message
  (define (post-message channel-id query)
    #f)

  ;; READ_MESSAGE_HISTORY
  ;; -> [message]
  (define (get-messages channel-id query)
    #f)

  ;; READ_MESSAGE_HISTORY
  ;; -> message
  (define (get-message channel-id message-id)
    #f)

  ;;
  ;; -> [message]
  (define (get-pinned-messages channel-id)
    #f)

  ;; MANAGE_MESSAGES
  ;; -> message
  (define (put-pinned-message channel-id message-id)
    #f)
 
  ;; MANAGE_MESSAGES
  ;; ->
  (define (delete-pinned-message channel-id message-id)
    #f)

  ;;
  ;; -> message
  (define (patch-message channel-id message-id)
    #f)

  ;; MANAGE_MESSAGES
  ;; ->
  (define (delete-message channel-id message-id)
    #f)

  ;; MANAGE_MESSAGES
  ;; ->
  (define (post-bulk-deletion channel-id query)
    #f)

  ;; READ_MESSAGE_HISTORY [ADD_REACTIONS]
  ;; ->
  (define (put-reaction channel-id message-id emoji)
    #f)

  ;; MANAGE_MESSAGES
  ;; ->
  (define (delete-reaction channel-id message-id emoji user-id)
    ;; user-id = "", emoji = "" -> all
    ;; user-id = "@me" -> own
    #f)

  ;;
  ;; -> [user]
  (define (get-reactions channel-id message-id emoji)
    #f)

  ;; MANAGE_ROLES
  ;; ->
  (define (put-channel-permission channel-id overwrite-id)
    #f)

  ;; MANAGE_ROLES
  ;; ->
  (define (delete-channel-permission channel-id overwrite-id)
    #f)

  ;; MANAGE_CHANNELS
  ;; -> [invite]
  (define (get-channel-invites channel-id query)
    #f)

  ;; CREATE_INSTANT_INVITES
  ;; -> invite
  (define (post-channel-invite channel-id query)
    #f)

  ;;
  ;; ->
  (define (post-typing channel-id)
    #f)

  ;;
  ;; ->
  (define (put-group-user channel-id user-id)
    #f)

  ;;
  ;; ->
  (define (delete-group-user channel-id user-id)
    #f))
