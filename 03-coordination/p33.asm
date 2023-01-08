	org 100H      ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 3 Aufgabe 3:

start: in al,0        ; Wert der Schalter nach AL auslesen
       test al,01h;   ; Vergleich ob S0 aktiv
                      ; Falls nicht aktiv:
       jz next        ; Sprung nach Next
                      ; Sonst:
       mov al,255     ; Wert Aller Schalter-LEDs auf AL
       out 0,al       ; Ausgabe AL
       call zeit      ; Warteschleife aufrufen

next:  mov al,0       ; Wert fuer keine Schalter-LEDs auf AL
       out 0,al       ; Ausgabe AL
       call zeit      ; Warteschleife aufrufen
       jmp start      ; Sprung nach Start

zeit:  push bx        ; BX in Stack schieben
       in al,0        ; Schalter auslesen
       test al,80h    ; Vergleich ob Schalter 7 aktiv
                      ; Falls nicht aktiv:
       jz slow        ; Sprung nach Slow
                      ; Sonst:
       mov bx, 30000  ; Wert 30.000 auf BX
       jmp again      ; Sprung nach Again

slow:  mov bx,50000   ; Wert 50.000 auf BX
       jmp again      ; Sprung nach Again

again: dec bx         ; BX dekrementieren
                      ; Falls BX ungleich null:
       jnz again      ; Sprung nach Again
                      ; Sonst:
       pop bx         ; BX vom Stack holen
       ret            ; Zum Unterprogramm zurueckkehren


;----------------------------------------