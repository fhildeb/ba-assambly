       	org 100H        ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 4 Aufgabe 2:

        mov ax,0        ; Wert 0 auf AX
        mov dx,90h      ; Wert von Segment 0 auf DX

start:  out dx,ax       ; Ausgabe AX auf Segment 0
        add dx,2        ; Segment um 2 erhoehen
        cmp dx,9eh      ; Vergleich ob DX das letze Segment ist
                        ; Falls DX letztes Segment:
        jz ende         ; Sprung nach Ende
                        ; Sonst
        jmp start       ; Sprung nach Start
ende:   mov al,0        ; Wert 0 nach AL
        jmp start       ; Sprung nach Start
        
;----------------------------------------