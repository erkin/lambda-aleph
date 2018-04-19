;; -*- coding: utf-8; mode: scheme -*-
;; Put your webhook secrets here and rename it secret.scm
;; Or rename it whatever you want and call it in λℵ.system
(module webhook-secrets (webhook-uri)
  (import chicken scheme)
  (use uri-common)
  (define webhook-id "<your-webhook-id-here>")
  (define webhook-token "<your-webhook-token-here>")
  (define webhook-uri
    (uri-reference
     (string-append "https://canary.discordapp.com/api/webhooks/"
                    webhook-id "/" webhook-token))))
