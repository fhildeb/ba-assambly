	org 100H      ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 3 Aufgabe 2:

       mov al,1       ; Wert 1 auf AL

ps:    mov cx,7       ; Wert 7 auf CX

start: out 0,al       ; Ausgabe AL auf Schalter-LEDs
       call zeit      ; Warteschleife aufrufen
       rol al,1       ; Wert von AL binaer um 1 nach
                      ; links rotieren
       dec cx         ; CX dekrementieren
       jnz start      ; Falls CX ungleich Null:
                      ; Sprung zu Start
                      ; Sonst
       mov cx,7       ; Wert 7 auf CX

right: out 0,al       ; Ausgabe AL auf Schalter-LED
       call zeit      ; Warteschleife aufrufen
       ror al,1       ; Wert von AL binaer um 1 nach
                      ; rechts rotieren
       dec cx         ; CX dekrementieren
       jz ps          ; Falls CX Null:
                      ; Sprung nach PS
                      ; Sonst:
       jmp right      ; Sprung nach Right

zeit:  push bx        ; BX in Stack schieben
       mov bx, 50000  ; Wert 50.000 auf BX
       jmp again      ; Sprung zu Again
                      
again: dec bx         ; Dekrementieren BX
       jnz again      ; Falls BX ungleich 0,
                      ; Sprung zu Again
       pop bx         ; BX vom Stack nehmen
       ret            ; Zu Unterprogramm zurueckkehren

;----------------------------------------