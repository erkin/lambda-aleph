(module λℵ-rest-voice *
  (import chicken scheme)
  (import λℵ-rest)
  (use (only uri-common make-uri))
  
;;; This file implements the `voice` section of the Discord REST API
;;; https://discordapp.com/developers/docs/resources/voice

;;; See channel.scm for docstring reference.

  ;;
  ;;
  ;; (voice)
  (define (get-voice-regions)
    (rest-request
     request: 'GET
     sub-uri: (make-uri path: `("voice" "regions")))))
