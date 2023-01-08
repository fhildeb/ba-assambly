       org 100H             ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 2 Aufgabe 1:

start: mov al,7             ; Wert 7 auf AL
       out 0,al             ; AL auf Schalter-LED ausgeben
       call zeit            ; Warteschleife aufrufen
       mov al,0             ; Wert 0 auf AL
       out 0,al             ; AL auf Schalter-LED ausgeben
       call zeit            ; Warteschleife aufrufen
       jmp start            ; Sprung zu Start

zeit:  push bx              ; BX in Stack schieben
       mov bx, 50000        ; Wert 50.000 auf BX
       jmp again            ; Sprung zu Again

again: dec bx               ; Dekrementieren BX
       jnz again            ; Falls BX ungleich 0,
                            ; Sprung zu Again
       pop bx               ; BX vom Stack nehmen
       ret                  ; Zu Unterprogramm zurueckkehren

;----------------------------------------