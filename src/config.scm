;;;; λℵ-project - config.scm
;;;;
;;;; Holds constants related to the project itself
;;;; Will contain configuration parameters in the future

(module λℵ-project *
  (import chicken scheme)
  (use (only uri-common absolute-uri))
  
  (define-constant project-url "https://erkin.co/lambda-aleph")
  (define-constant project-version "0.1.5")
  (define-constant project-name "λℵ"))
