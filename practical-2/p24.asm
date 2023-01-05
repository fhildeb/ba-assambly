	org 100H             ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 2 Aufgabe 4:

                            ; Display auf 0 setzen:
       mov al,0
       out 90H,al
       out 92H,al
       out 98H,al
       out 9AH,al
       out 9CH,al
       out 94H,al
       out 96H,al


start:
       mov al,00000110b     ; Wert fuer Schalter S1 und S2 auf AL
       out 90H,al           ; AL ausgeben
       call zeit            ; Warteschleife aufrufen
       mov al,00111111b     ; Wert fuer Schalter S0-S5 auf AL
       out 90H,al           ; AL ausgeben
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