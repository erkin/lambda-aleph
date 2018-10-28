;;;; λℵ-sockets - websockets.scm
;;;;
;;;; TODO: Implementation of websockets
;;;; The default way of connecting to Discord

(module λℵ-sockets ()
  (import chicken scheme)
  (use websockets)
  (use (only uri-common absolute-uri))
  (define-constant socket-uri (absolute-uri "wss://gateway.discord.gg/")))
