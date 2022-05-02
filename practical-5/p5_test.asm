
		ORG 100H			; Startadresse auf 100 setzen

;----------------------------------------

; PRAKTIKUM 5 Test:

; UNTERPROGRAMME UND STACK

; Beschreiben Sie den Verlauf des Stackbereiches !
; Auf welchen Adressen werden welche Werte zu
; welchem Zweck abgelegt ?
; Beobachten Sie den Stackpointer und den Stack!
; (Fenster Register und Memory)

start:	mov ax,1234h        ; Register initialisieren
		mov bx,5678h
        mov cx,9abch
		call spwr           ; Unterprogrammaufruf
		mov si,bx           ; bx nach si kopieren
		mov di,ax           ; ax nach di kopieren
		jmp start

buf:	db 0                ; Variablendeklaration
		db 0

spwr:	push ax             ; Register sichern
		push bx
		mov bx,buf          ; 0 nach bx schreiben
		in al,0             ; Schalter einlesen
		mov [bx],al         ; Schalter nach [0] schreiben
		call zeit           ; UP Zeit aufrufen
		in al,0             ; Schalter einlesen
		mov [bx+1],al       ; und nach [1] schreiben
		call zeit           ; UP Zeit nochmal aufrufen
		pop bx              ; Register zurueckschreiben
		pop ax
		ret	              	; UP beenden


zeit:	push cx				; Register sichern
		xor cx,cx           ; cx auf 0 setzen
schl:	loop schl           ; Zeitschleife
		pop cx              ; cx zurueckschreiben
		ret                 ; UP beenden

;----------------------------------------