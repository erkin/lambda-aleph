;; Put your webhook secrets here and rename it secret.scm
;; Or rename it whatever you want and call it in λℵ.system
(module webhook-secrets (webhook-id webhook-token)
  (import scheme)
  (define webhook-id "<your-webhook-id-here>")
  (define webhook-token "<your-webhook-token-here>"))

(module app-secrets (app-token)
  (import scheme)
  (define app-token "<your-app-token-here>"))
