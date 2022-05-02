        org 100H                ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 4 Aufgabe 1:

start:  in al,0                 ; Wert der Schalter auf AL
        mov bx,200h             ; Wert 200 auf BX

write:  mov [bx],al             ; Wert der Schalter auf Adresse BX
        mov cx,bx               ; Wert von BX auf CX
        mov [bx+100h],cx        ; Wert von CX auf Adresse von BX+100h
        inc bx                  ; BX inkrementieren
        cmp bx,300h             ; Vergleich BX mit 300h
                                ; Falls BX ungleich 300h:
        jnz write               ; Sprung nach Write
                                ; Sonst:
        jmp start               ; Sprung nach Start
        
;----------------------------------------