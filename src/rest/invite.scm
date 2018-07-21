(module λℵ-rest-invite *
  (import chicken scheme)
  (import λℵ-rest)
  (use (only uri-common make-uri))
  
;;; This file implements the `invite` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/invite

;;; See channel.scm for docstring reference.

  ;;
  ;;
  ;; invite
  (define (get-invite invite-code #!key (with-counts #f))
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("invites" ,invite-code)
                        query: `((with_counts . ,with-counts)))))

  ;; MANAGE_CHANNELS
  ;;
  ;; invite
  (define (delete-invite invite-code)
    (rest-request
     request: 'DELETE
     sub-uri: (make-uri path: `("invites" ,invite-code)))))
