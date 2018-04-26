(module rest (api-uri)
  (import chicken scheme)
  (use http-client intarweb uri-common medea)
  (import project secrets)

  ;; https://discordapp.com/developers/docs/reference
  (define api-uri "https://canary.discordapp.com/api")

  (define get-headers
    (headers `((content-type application/json)
               (authorization #(basic (bot . ,secret-app-token)))))))
