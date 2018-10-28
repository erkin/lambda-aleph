;;;; λℵ-rest - rest.scm
;;;;
;;;; Interface for REST requests
;;;; See rest/ for individual requests

(module λℵ-rest (rest-request)
  (import chicken scheme data-structures)
  (require-extension srfi-69)
  (use http-client intarweb uri-common medea)
  (import λℵ-project λℵ-secret)

  (define-constant api-uri (absolute-uri "https://canary.discordapp.com/api/"))
  
;;; basic-auth-unparser requires `username` and `password` strings in
;;; the `Authorization` header. Discord just needs a `Bot` token string.
;;; So, we're defining a new auth-unparser here.
;;; https://discordapp.com/developers/docs/reference#authentication
  
  (define auth-header `((authorization #(discord ((bot-token . ,secret-app-token))))))

  (define authorization-unparser
    (alist-ref 'authorization (header-unparsers)))

  (define (discord-auth-unparser header-contents)
    (map (lambda (header)
           (if (eq? (get-value header) 'discord)
               (string-append "Bot " (alist-ref 'bot-token (get-params header)))
               (authorization-unparser (list header))))
         header-contents))

  (header-unparsers
   `((authorization . ,discord-auth-unparser) . ,(header-unparsers)))

;;; Bot's user agent
;;; https://discordapp.com/developers/docs/reference#user-agent

;;; Discord doesn't recognise the version string and wants it to be incorporated
;;; in the system information section, so we're leaving the version string
;;; blank (#f) and appending it to our project URL instead.

  (client-software
   `(,'("DiscordBot" #f (string-append project-url ", " project-version))))

  (form-urlencoded-separator "&")
  
  (define (rest-request #!key (request 'GET) (query #f) (payload #f) (sub-uri #f))
    (define rest-request-header   ; TODO: implement X-Audit-Log-Reason
      (if query ; Set the content type if we're sending JSON queries or embed data
          (headers (append auth-header '((content-type #(application/json ((charset . utf-8)))))))
          (headers auth-header))) ;; TODO: add multipart/form-data for payload
    (receive (result uri status)
        (call-with-input-request
         (make-request method: request
                       uri: (uri-relative-to sub-uri api-uri)
                       headers: rest-request-header)
         (if query (json->string query) #f)
         read)
      (print "Received: " result)
      (print "Got response " (response-status status) " from " (uri->string uri)))))
