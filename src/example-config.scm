(module λℵ-project *
  (import chicken scheme)
  (use (only uri-common absolute-uri))

  (define-constant project-url "https://erkin.co/lambda-aleph")
  (define-constant project-version "0.1.x")
  (define-constant project-name "λℵ")
  
  ;; https://discordapp.com/developers/docs/reference
  (define-constant api-uri (absolute-uri "https://canary.discordapp.com/api"))
  (define-constant socket-uri (absolute-uri "wss://gateway.discord.gg/")))

(module λℵ-secret *
  (import scheme)

  (define-constant secret-app-token "my app token"))
