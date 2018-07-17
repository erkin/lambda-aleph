(module λℵ-rest-audit *
  (import chicken scheme)
  (import λℵ-rest)
  
;;; This file implements the `audit-log` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/audit-log

;;; See channel.scm for docstring reference.

  ;; VIEW_AUDIT_LOG
  ;; [user_id] [action_type] [before] [limit]
  ;; audit-log
  (define (get-audit-log guild-id query)
    (rest-request
     request: 'GET sub-uri: (string-append "/guilds/" guild-id "/audit-logs")
     query: query)))
