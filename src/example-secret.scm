;; Put your secrets here and rename it secret.scm
;; Or rename it whatever you want and call it in λℵ.system
(module secrets *
  (import scheme)
  
  (define secret-webhook-id "<your-webhook-id-here>")
  (define secret-webhook-token "<your-webhook-token-here>")
  (define secret-app-token "<your-app-token-here>"))
