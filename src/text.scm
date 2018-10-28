;;;; λℵ-text - text.scm
;;;;
;;;; CLI improvements

(module λℵ-text (tint print-banner)
  (import chicken scheme (only data-structures ->string alist-ref))
  (import λℵ-project)

  (define banner
    (string-append
     " __   __   __\n"
     " \\ \\  \\ \\ / /\n"
     "  > \\ |  V / \n"
     " / ^ \\| |\\ \\ \n"
     "/_/ \\_|_| \\_\\\n"))

;;; TODO: 24-bit colours for maximum uselessness
  (define-constant ansi-colours
    '((black   . "0")
      (red     . "1")
      (green   . "2")
      (yellow  . "3")
      (blue    . "4")
      (purple  . "5")
      (cyan    . "6")
      (white   . "7")
      (default . "9")))

  (define-constant ansi-styles
    '((regular    .  "0")
      (bold       .  "1")
      (faint      .  "2")
      (italic     .  "3")
      (underlined .  "4")
      ;; the rest is useless
      (blink      .  "5")
      (flash      .  "6")
      (swap       .  "7")
      (crossed    .  "9")
      ;; the rest is dead
      (fraktur    . "20")
      (framed     . "50")
      (circled    . "52")
      (overlined  . "53")))
  
  (define (tint string fg #!key (bg 'default) (style 'regular))
    (string-append
     "\033["
     (alist-ref style ansi-styles)
     ";3" (alist-ref fg ansi-colours)
     ";4" (alist-ref bg ansi-colours)
     "m"  (->string string)
     "\033[0m"))
  
  (define (print-banner)
    (print (tint banner 'cyan))
    (print (tint "v" 'yellow)
           (tint project-version 'yellow))
    (newline)))
