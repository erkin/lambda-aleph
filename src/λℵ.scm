(use http-client srfi-13)
(import webhook project)

;; Bot's user agent
;; https://discordapp.com/developers/docs/reference#user-agent
;;
;; Discord doesn't recognise the version string and wants it to be incorporated
;; in the system information section, so we're leaving the version string blank
;; and appending it to our project URL
(client-software
 (list (list "DiscordBot" #f (string-append project-url ", " project-version))))

(define arguments
  (string-join (cdr (argv))))

(webhook-send webhook-uri (webhook-payload arguments))
