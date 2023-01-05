          org 100H          ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 4 Aufgabe 4:

            mov ah,0        ; Interrupt 6 vorbereiten
            int 6
            mov bl,1        ; Interrupt 6- Zahl
            mov ah,4        ; Interrupt 6- INT-Param
            mov dl,0        ; Interrupt 6- Display

            mov cl,4        ; Wert 4 auf CL

start:      mov cx,04fffh   ; Warten bis Null

loop1:      loop loop1      ; warten

            in al,0         ; Schalter einlesen
            test al,1       ; Vergleich AL mit Schalter 1
                            ; Falls nicht aktiv:
            jz start        ; Sprung zu Start
                            ; Sonst
            mov cl,4        ; Wert 4 fuer Shift
            shl bl,cl       ; Um 4 nach links shiften
            int 6           ; Interrupt 6 ausloesen
            shr bl,cl       ; Zurueckshiften zum Ausgangswert
            inc bl          ; Wuerfel erhoehen
            cmp bl,7        ; Vergleich ob Wuerfel gleich 7 ist
                            ; Falls nein:
            jnz start       ; Sprung nach Start
                            ; Sonst:
            mov bl,1        ; Wieder auf 1 setzen
            jmp start       ; Sprung nach Start
            
;----------------------------------------