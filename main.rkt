;;#lang racket
#lang racket

(define roman-keys '(1000 500 100 50 10 5 1))
(define roman-vals '("M" "D" "C" "L" "X" "V" "I"))

(define long-to-short-keys '("DCCCC" "CCCC" "LXXXX" "XXXX" "VIIII" "IIII"))
(define long-to-short-vals '("CM" "CD" "XC" "XL" "IX" "IV"))

(define (to-roman number)
  (let ((difference 0) (amount 0)(roman ""))
    (for ([key roman-keys] [value roman-vals])
      (set! difference (- number (modulo number key)))
      (set! amount (/ difference key))
      (for ([j amount])
        (set! roman (string-append roman value)))
      (set! number (- number difference)))
    (for ([key long-to-short-keys] [value long-to-short-vals])
      (set! roman (regexp-replace key roman value)))
    roman))

(printf "roman: ~a \n" (to-roman 2023))
