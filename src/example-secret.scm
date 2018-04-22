;; Put your webhook secrets here and rename it secret.scm
;; Or rename it whatever you want and call it in λℵ.system
(module webhook-secrets (webhook-id webhook-token)
  (import chicken scheme)
  (use uri-common)
  (define webhook-id "<your-webhook-id-here>")
  (define webhook-token "<your-webhook-token-here>"))
