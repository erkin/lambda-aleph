(module λℵ-rest-audit *
  (import chicken scheme data-structures)
  (import λℵ-rest)
  (use (only uri-common make-uri))
  
;;; This file implements the `audit-log` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/audit-log

;;; See channel.scm for docstring reference.

  (define audit-log-events
    '( ;; Guild events
      (event-guild-update . 1)

      ;; Channel events
      (event-channel-create . 10)
      (event-channel-update . 11)
      (event-channel-delete . 12)

      ;; Channel events
      (event-permission-create . 13)
      (event-permisison-update . 14)
      (event-permission-delete . 15)

      ;; Member events
      (event-member-kick   . 20)
      (event-member-prune  . 21)
      (event-member-ban    . 22)
      (event-member-unban  . 23)
      (event-member-update . 24)
      (event-member-role   . 25)

      ;; Role events
      (event-role-create . 30)
      (event-role-update . 31)
      (event-role-delete . 32)

      ;; Invite events
      (event-invite-create . 40)
      (event-invite-update . 41)
      (event-invite-delete . 42)

      ;; Webhook events
      (event-webhook-create . 50)
      (event-webhook-update . 51)
      (event-webhook-delete . 52)

      ;; Emoji events
      (event-emoji-create . 60)
      (event-emoji-update . 61)
      (event-emoji-delete . 62)))


  ;; VIEW_AUDIT_LOG
  ;;
  ;; audit-log
  (define (get-audit-log guild-id #!key (user-id #f) (action-type #f) (before #f) (limit #f))
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("guilds" ,guild-id "audit-logs")
                        query: `((user_id . ,user-id)
                                 (action_type . ,(alist-ref action-type audit-log-events))
                                 (before . ,before)
                                 (limit . ,limit))))))
