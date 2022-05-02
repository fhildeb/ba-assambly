        org 100H        ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 1:

start:  in al,0         ; Schalterstellung einlesen
        out 0,al        ; und auf die LED-Zeile ausgeben
        mov cx,0a000h   ; Zaehler für Zeitschleife laden
schl1:  loop schl1      ; loop: zwei Befehle in einem
        dec cx          ; Dekrementiere <CX>
        jnz             ; schl1 solange <CX> ungleich 0
        mov al,0
        out 00,al       ; alle LED „ausschalten“
        mov cx,0a000h
schl2:  loop schl2
        jmp start       ; Endlosschleife

;----------------------------------------