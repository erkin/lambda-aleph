(module λℵ-rest-audit *
  (import chicken scheme)
  (import λℵ-rest)
  (use (only uri-common make-uri))
  
;;; This file implements the `audit-log` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/audit-log

;;; See channel.scm for docstring reference.

  ;; Guild events
  (define-constant event-guild-update 1)

  ;; Channel events
  (define-constant event-channel-create 10)
  (define-constant event-channel-update 11)
  (define-constant event-channel-delete 12)

  ;; Channel events
  (define-constant event-permission-create 13)
  (define-constant event-permisison-update 14)
  (define-constant event-permission-delete 15)

  ;; Member events
  (define-constant event-member-kick   20)
  (define-constant event-member-prune  21)
  (define-constant event-member-ban    22)
  (define-constant event-member-unban  23)
  (define-constant event-member-update 24)
  (define-constant event-member-role   25)

  ;; Role events
  (define-constant event-role-create 30)
  (define-constant event-role-update 31)
  (define-constant event-role-delete 32)

  ;; Invite events
  (define-constant event-invite-create 40)
  (define-constant event-invite-update 41)
  (define-constant event-invite-delete 42)

  ;; Webhook events
  (define-constant event-webhook-create 50)
  (define-constant event-webhook-update 51)
  (define-constant event-webhook-delete 52)

  ;; Emoji events
  (define-constant event-emoji-create 60)
  (define-constant event-emoji-update 61)
  (define-constant event-emoji-delete 62)


  ;; VIEW_AUDIT_LOG
  ;;
  ;; audit-log
  (define (get-audit-log guild-id #!key (user-id #f) (action-type #f) (before #f) (limit #f))
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("guilds" ,guild-id "audit-logs")
                        query: `((user_id . ,user-id)
                                 (action_type . ,action-type)
                                 (before . ,before)
                                 (limit . ,limit))))))
