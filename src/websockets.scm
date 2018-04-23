(module socket ()
  (import chicken scheme)
  (import project secrets)
  (use websockets)

  (define socket-uri "wss://gateway.discord.gg/"))
