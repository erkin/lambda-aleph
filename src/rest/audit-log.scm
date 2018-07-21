(module λℵ-rest-audit *
  (import chicken scheme)
  (import λℵ-rest)
  (use (only uri-common make-uri))
  
;;; This file implements the `audit-log` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/audit-log

;;; See channel.scm for docstring reference.

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
