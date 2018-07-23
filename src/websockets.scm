(module λℵ-sockets ()
  (import chicken scheme)
  (use websockets)
  (define-constant socket-uri (absolute-uri "wss://gateway.discord.gg/")))
