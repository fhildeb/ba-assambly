	org 100H      ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 2 Aufgabe 3:

       mov al,1       ; Wert 1 auf AL

ps:    mov cx,7       ; Wert 7 auf CX

start: out 0,al       ; Ausgabe AL auf Schalter-LED
       call zeit      ; Warteschleife aufrufen
       rol al,1       ; Wert von AL binaer um
                      ; eine Stelle nach links rotieren
       dec cx         ; CX dekrementieren
       jnz start      ; Falls CX nicht null:
                      ; Sprung zu Start
       mov cx,7       ; Wert 7 auf CX

right: out 0,al       ; Ausgabe AL auf Schalter-LED
       call zeit      ; Warteschleife aufrufen
       ror al,1       ; Wert von AL binaer um
                      ; eine Stelle nach rechts rotieren
       dec cx         ; CX dekrementieren
       jz ps          ; Falls CX Null,
                      ; Sprung nach PS
                      ; Sonst:
       jmp right      ; Sprung nach Rechts

zeit:  push bx        ; BX in Stack schieben
       mov bx, 50000  ; Wert 50.000 auf BX
       jmp again      ; Sprung zu Again

again: dec bx         ; Dekrementieren BX
       jnz again      ; Falls BX ungleich 0,
                      ; Sprung zu Again
       pop bx         ; BX vom Stack nehmen
       ret            ; Zu Unterprogramm zurueckkehren

;----------------------------------------