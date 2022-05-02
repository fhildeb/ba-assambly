          org 100H              ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 4 Aufgabe 3:

display:        equ 90h         ; Segment 0 als Display speichern

                mov ah,0        ; Wert 0 auf AH
                int 6           ; Interrupt 6 ausloesen
start:
                in al,0         ; Einlesen welche Schalter aktiv sind
                mov bl,al       ; Wert von AL auf BL
                and bl,0fh      ; Und-Verknuefung mit 0000 1111,
                                ; da nur ersten 4 Ziffern relevant
                mov si,ctab     ; Codetabelle nach SI
                mov al,[si+bx]  ; Adresse vom Start der Codetabelle
                                ; so gross wie Schalterwert ist hochzaehlen
                                ; und auf AL schreiben
                out display,al  ; AL auf Segment 0 ausgeben
                jmp start       ; Sprung nach Start

ctab:           db 00111111b       ; 0
                db 00000110b       ; 1
                db 01011011b       ; 2
                db 01001111b       ; 3
                db 01100110b       ; 4
                db 01101101b       ; 5
                db 01111101b       ; 6
                db 00000111b       ; 7
                db 01111111b       ; 8
                db 01101111b       ; 9
                db 01110111b       ; A
                db 01111100b       ; B
                db 00111001b       ; C
                db 01011110b       ; D
                db 01111001b       ; E
                db 01110001b       ; F

;----------------------------------------