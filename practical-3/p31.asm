	org 100H       ; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 3 Aufgabe 1:

start: in al,0         ; Schalter einlesen
       test al,01h     ; Vergleich ob S0 gedrueckt
       jz next         ; Wenn nicht gedrueckt:
                       ; Sprung zu Next
                       ; Sonst
       mov al,255      ; Wert fuer alle LEDs auf AL
       out 0,al        ; AL ausgeben
       jmp start       ; Sprung zu Start

next:  mov al,0        ; Wert fuer keine LEDs auf AL
       out 0,al        ; AL ausgeben
       jmp start       ; Sprung zu Start

;----------------------------------------