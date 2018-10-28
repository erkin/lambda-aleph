;;;; λℵ-secret - secret.scm
;;;;
;;;; Holds constants that are not meant to be seen by anyone else
;;;; (Move this file to secret.scm)

(module λℵ-secret *
  (import chicken scheme)

  (define-constant secret-app-token "my app token"))
