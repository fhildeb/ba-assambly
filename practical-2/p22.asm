	org 100H             ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 2 Aufgabe 2:

start: mov al,01010101b     ; Wert fuer jede zweite LED
       out 0,al             ; Ausgabe AL auf Schalter-LED
       call zeit            ; Warteschleife aufrufen
       rol al,1             ; Wert fuer jede zweite LED nach
                            ; Links rotieren
       out 0,al             ; Ausgabe AL auf Schalter-LED
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