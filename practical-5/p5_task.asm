                ORG 100h            ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 5 Aufgabe:

ziffer2:        EQU 94h
ziffer3:        EQU 96h
ziffer6:        EQU 9ch  

                MOV bl,1            ; Init Ausgabewert 6
                MOV bh,-2           ; Init Ausgabewert 2/3
                call clrdisp

start:          
                IN al,0             ; Schalter einlesen
                TEST al,01000000b   ; Schalter 6 an?
                JZ zweidrei         ; nein
                DEC bl              ; Zaehler dekrementieren
                MOV dx,ziffer6      ; Adresse nach dx laden
                PUSH ax             ; AX sichern
                MOV al,bl           ; BL (Ausgabewert 6) nach AL schreiben
                CALL anz1st         ; und Ziffer ausgeben
                POP ax              ; AX zurueckschreiben
zweidrei:
                TEST al,00001100b   ; Schalter 2 oder 3 an?
                JZ loop1            ; nein
                INC bh              ; Ausgabewert hochzaehlen
                INC bh
                MOV dx,ziffer3      ; Adresse nach dx laden
                MOV al,bh           ; BH (Ausgabewert 2/3) nach AL schreiben
                CALL anz2nd         ; und anzeigen

loop1:          loop loop1          ; Zeitverzoegerung
                JMP start

clrdisp:
                ; Unterprogramm "clrdisp" - Loescht das Display
                PUSH ax             ; Variablen speichern
                MOV ah,0            ; Display loeschen
                INT 6
                POP ax              ; Variablen zurueckschreiben
                RET
anz1st:
                ; Unterprogramm "anz1st" - Anzeige Wert 0-F auf Display-Stelle 0-7
                ; Uebergabe: <AL> Anzeigewert 0-F, <DX> Displaystelle (oder Portadresse)
                PUSH ax             ; Werte speichern
                PUSH bx

                MOV bx,0
                MOV bl,al           ; nach bl kopieren
                AND bl,0fh          ; Maske, nur Bit 0-3
                MOV si,ctab         ; Adresse des Anfangs der Tabelle laden
                MOV al,[si+bx]      ; Ziffer nach al laden
                OUT dx,al           ; und ausgeben

                POP bx              ; zurueckschreiben
                POP ax
                RET
anz2nd:         
                ; Unterprogramm "anz2nd" - Anzeige Wert 00-FF auf 2 Displaystellen
                ; Uebergabe: <AL> - Anzeigewert 00-FF, <DX> - linke Displaystelle (oder Adresse)
                PUSH ax             ; Register sichern
                PUSH cx
                PUSH dx
                MOV cl,4            ; obere 4 Bits in die unteren verschieben
                ROR al,cl
                CALL anz1st         ; Anzeige Ziffer AL Bit 7-4 auf Displaystelle DX
                DEC dx              ; Stelle nach rechts
                DEC dx
                ROR al,cl           ; untere 4 Bits wieder nach hinten
                CALL anz1st         ; Anzeige Ziffer AL Bit 3-0 rechts daneben
                POP dx              ; Register zurueckschreiben
                POP cx
                POP ax
                RET
                

ctab:           db 00111111b        ; 0
                db 00000110b        ; 1
                db 01011011b        ; 2
                db 01001111b        ; 3
                db 01100110b        ; 4
                db 01101101b        ; 5
                db 01111101b        ; 6
                db 00000111b        ; 7
                db 01111111b        ; 8
                db 01101111b        ; 9
                db 01110111b        ; A
                db 01111100b        ; b
                db 00111001b        ; C
                db 01011110b        ; d
                db 01111001b        ; E
                db 01110001b        ; F

;----------------------------------------