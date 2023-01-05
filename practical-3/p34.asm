	org 100H        ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 3 Aufgabe 4:

                        ; Display auf 0 setzen:
       mov al,0
       out 90H,al
       out 92H,al
       out 98H,al
       out 9AH,al
       out 9CH,al
       out 94H,al
       out 96H,al

start: in al,0              ; Wert der Schalter nach AL einlesen
       cmp al, 18h          ; Vergleich ob Schalter S3 und S4 aktiv
                            ; Falls beide aktiv:
       jz both              ; Sprung nach Both
                            ; Sonst:
       test al,08h          ; Vergleich ob Schalter S3 aktiv
                            ; Falls S3 aktiv:
       jnz first            ; Sprung nach First
                            ; Sonst:
       test al,10h          ; Vergleich ob S4 aktiv
                            ; Falls S4 aktiv:
       jnz second           ; Sprung nach Second
                            ; Sonst:
       mov al,00111111b     ; Wert fuer Segmentanzeige "0" auf AL
       out 94H,al           ; Ausgabe AL auf Segment 1
       out 96H,al           ; Ausgabe AL auf Segment 2
       jmp start            ; Sprung nach Start

both:  mov al,00000110b     ; Wert fuer Segmentanzeige "1" auf AL
       out 94h,al           ; Ausgabe AL auf Segment 1
       out 96h,al           ; Ausgabe AL auf Segment 2
       jmp start            ; Sprung nach Start

first: mov al,00000110b     ; Wert fuer Segmentanzeige "1" auf AL
       out 94h,al           ; Ausgabe AL auf Segment 1

       mov al,00111111b     ; Wert fuer Segmentanzeige "0" auf AL
       out 96h,al           ; Ausgabe AL auf Segment 2
       jmp start            ; Sprung nach Start

second: mov al,00000110b    ; Wert fuer Segmentanzeige "1" auf AL
        out 96h,al          ; Ausgabe AL auf Segment 2
        mov al,00111111b    ; Wert fuer Segmentanzege "0" auf AL
        out 94h,al          ; Ausgabe AL auf Segment 1
        jmp start           ; Sprung nach Start

;----------------------------------------