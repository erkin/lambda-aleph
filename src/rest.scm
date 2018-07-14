(module λℵ-rest *
  (import chicken scheme data-structures)
  (use http-client intarweb uri-common medea)
  (import λℵ-project λℵ-secret)
  
  ;; basic-auth-unparser requires `username` and `password` strings in
  ;; the `Authorization` header. Discord just needs a `Bot` token string.
  ;; https://discordapp.com/developers/docs/reference#authentication
  
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

  
  ;; A macro to avoid repetition and simplify channel requests

  ;; TODO
  ;; (define-syntax channel-request
  ;;   (syntax-rules ()
  ;;     ((_ channel-id)
  ;;      (call-with-input-request
  ;;       (make-request method: 'GET
  ;;                     uri: (uri-reference
  ;;                           (string-append api-uri sub-uri))
  ;;                     headers: (headers auth-headers))))))

  (define (channel-request #!key (request 'GET) (query #f) (payload #f) (sub-uri ""))
    (call-with-input-request
     (make-request method: request
                   uri: (uri-reference
                         (string-append api-uri sub-uri))
                   headers: (if query
                                (headers (append auth-header '(content-type . application/json) query))
                                (if payload
                                    (headers (append auth-header '(content-type . multipart/form-data)))
                                    (headers auth-header))))
     #f
     current-output-port)))
