(module λℵ-project *
  (import scheme)

  (define-constant project-url "https://erkin.co/lambda-aleph")
  (define-constant project-version "0.1.3")
  (define-constant project-name "λℵ")
  
  ;; https://discordapp.com/developers/docs/reference
  (define-constant api-uri "https://canary.discordapp.com/api")
  (define-constant socket-uri "wss://gateway.discord.gg/"))

(module λℵ-secret *
  (import scheme)

  (define-constant secret-app-token "my app token"))
