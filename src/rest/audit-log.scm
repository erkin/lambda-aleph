(module λℵ-rest-audit *
  (import chicken scheme)
  (import λℵ-rest)
  
;;; This file implements the `audit-log` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/audit-log

;;; See channel.scm for docstring reference.

  ;; VIEW_AUDIT_LOG
  ;;
  ;; audit-log
  (define (get-audit-log guild-id #!key (user-id #f) (action-type #f) (before #f) (limit #f))
    (define query
      (string-append
       "?"
       (if user-id (string-append "user_id=" user-id "&") "")
       (if action-type (string-append "action_type=" action-type "&") "")
       (if before (string-append "before=" before "&") "")
       (if limit (string-append "limit=" limit) "")))
    (rest-request
     request: 'GET
     sub-uri: (string-append "/guilds/" guild-id "/audit-logs" query))))
