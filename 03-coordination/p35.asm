	org 100H      ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 3 Aufgabe 5:

start: mov al,0h     ; Wert fuer keine Schalter-LEDs auf AL
       out 0,al      ; AL ausgeben

       call zeit     ; Warteschleife aufrufen

       in al,0       ; Schalter nach AL einlesen
       cmp al, 81h   ; Vergleichen ob S0 und S7 aktiv
                     ; Falls aktiv:
       jz warn       ; Sprung nach Warn
                     ; Sonst:
       test al,1h    ; Vergleich ob S0 aktiv
                     ; Wenn S0 aktiv:
       jnz rabb      ; Sprung nach Rabb
                     ; Sonst:
       test al,80h   ; Vergleich ob S7 aktiv
                     ; Wenn S7 aktiv:
       jnz labb      ; Sprung nach Labb
                     ; Sonst:
       jmp start     ; Sprung nach Start

rabb:  mov al,0fh    ; Wert fuer rechte 4 Schalter-LEDs nach AL
       out 0,al      ; Ausgabe AL
       call zeit     ; Warteschleife aufrufen
       jmp start     ; Sprung nach Start

labb:  mov al,0f0h   ; Wert fuer linke 4 Schalter-LESs nach AL
       out 0,al      ; Ausgabe AL
       call zeit     ; Warteschleife aufrufen
       jmp start     ; Sprung nach Start

warn:  mov al,0ffh   ; Wert fuer alle Schalter-LEDs nach AL
       out 0,al      ; Ausgabe AL
       call zeit     ; Warteschleife aufrufen
       jmp start     ; Sprung nach Start

zeit:  push bx       ; BX in Stack schieben
       mov bx, 50000 ; Wert 50.000 auf BX
       jmp again     ; Sprung zu Again

again: dec bx        ; Dekrementieren BX
       jnz again     ; Falls BX ungleich 0,
                     ; Sprung zu Again
       pop bx        ; BX vom Stack nehmen
       ret           ; Zu Unterprogramm zurueckkehren

;----------------------------------------