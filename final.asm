.386
IDEAL
MODEL small
STACK 100h
DATASEG
;start picture data
filename db 'bbt.bmp',0
filehandle dw ?
Header db 54 dup (0)
Palette db 256*4 dup (0)
ScrLine db 320 dup (0)
ErrorMsg db 'Error', 13, 10,'$'

;for programmer:
;magneta_ball = tier 1 ball
;blue_ball = tier 2 ball
;red_ball = tier 3 ball 
;yellow_ball = tier 4 ball
;green_ball = tier 5 ball

x dw 100110b


game_1 db 'BUBBLE$'
game_2 db 'TROUBLE$'
start_game db 'PRESS ANY KEY TO START GAME$'
GR db 'GET READY!$'
GR_2 db '          $'
sec db ?
TA db 'TRY AGAIN!$'
GO db 'GAME OVER!$'
VR db ' VICTORY! $'
RUS db 'ARE YOU SURE YOU$'
RUS2 db 'WANT TO EXIT? y/n$'
RUSB db '                 $'

;help
ln1 db '        CONTROLS:$'
ln2 db ' USE RIGHT AND LEFT ARROWS TO MOVE.$'
ln3 db ' PRESS SPACE TO SHOOT YOUR GUN.$'
ln5 db '        HOW TO PLAY:$'
ln6 db ' TO WIN YOU NEED TO POP ALL THE BALOONS$'
ln7 db ' BE CAREFUL! IF YOU GET HIT BY ONE YOU$' 
ln8 db ' LOSE A LIVE.$'
ln10 db '     -PRESS ANY KEY TO CONTINUE-$'

magneta_ball db 00h,00h,05h,05h,05h,00h,00h
			 db 00h,05h,05h,05h,05h,05h,00h
			 db 05h,05h,05h,05h,05h,05h,05h
			 db 05h,05h,05h,05h,05h,05h,05h
			 db 05h,05h,05h,05h,05h,05h,05h
			 db 00h,05h,05h,05h,05h,05h,00h
			 db 00h,00h,05h,05h,05h,00h,00h
			 
magneta_height dw 7			 
magneta_width dw 7

blue_ball 	db 00h,00h,00h,03h,03h,03h,00h,00h,00h
			db 00h,00h,03h,03h,03h,03h,03h,00h,00h
			db 00h,03h,03h,03h,03h,03h,03h,03h,00h
			db 03h,03h,03h,03h,03h,03h,03h,03h,03h
			db 03h,03h,03h,03h,03h,03h,03h,03h,03h
			db 03h,03h,03h,03h,03h,03h,03h,03h,03h
			db 00h,03h,03h,03h,03h,03h,03h,03h,00h
			db 00h,00h,03h,03h,03h,03h,03h,00h,00h
			db 00h,00h,00h,03h,03h,03h,00h,00h,00h
			
blue_height dw 9
blue_width dw 9

red_ball 	db 00h,00h,04h,04h,04h,04h,04h,04h,00h,00h
			db 00h,04h,04h,04h,04h,04h,04h,04h,04h,00h
			db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
			db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
			db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
			db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
			db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
			db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
			db 00h,04h,04h,04h,04h,04h,04h,04h,04h,00h
			db 00h,00h,04h,04h,04h,04h,04h,04h,00h,00h
			
red_height dw 10
red_width dw 10
	
yellow_ball db 00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h
			db 00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h
			db 00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h
			db 00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h
			db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
			db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
			db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
			db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
			db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
			db 00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h
			db 00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h
			db 00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h
			db 00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h
			
yellow_height dw 13
yellow_width dw 13
			
green_ball 	db 00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,0Ah,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,0Ah,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h,00h
			db 00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h
			db 00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h
			db 00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h
			db 00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h
			db 00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h
			db 0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah
			db 0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah
			db 0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah
			db 0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah
			db 0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah
			db 0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah
			db 00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h
			db 00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h
			db 00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h
			db 00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h
			db 00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h
			db 00h,00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,0Ah,0Ah,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Ah,0Ah,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,0Ah,02h,02h,02h,02h,02h,02h,02h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h
			
green_height dw 26
green_width dw 25


active_ball db 650 dup(0)   
active_height dw ?
active_width dw ?


black_ball  db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
			
satan 		db 0Ch,00h,00h,08h,04h,04h,04h,04h,08h,00h,00h,0Ch
			db 0Ch,00h,04h,04h,04h,04h,04h,04h,04h,04h,00h,0Ch
			db 0Ch,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,0Ch
			db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
			db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
			db 00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h
			db 00h,00h,04h,04h,04h,08h,08h,04h,04h,04h,00h,00h
			db 00h,00h,00h,08h,08h,08h,08h,08h,08h,00h,00h,00h
			db 00h,00h,00h,08h,08h,08h,08h,08h,08h,00h,00h,00h
			db 00h,00h,00h,08h,08h,08h,08h,08h,08h,00h,00h,00h
			db 00h,00h,00h,00h,08h,08h,08h,08h,00h,00h,00h,00h
			db 00h,00h,00h,00h,08h,08h,08h,08h,00h,00h,00h,00h
			db 00h,00h,00h,00h,08h,08h,08h,08h,00h,00h,00h,00h
			db 00h,00h,00h,00h,08h,08h,08h,08h,00h,00h,00h,00h
			db 00h,00h,00h,08h,08h,08h,08h,08h,08h,00h,00h,00h
			db 00h,00h,08h,08h,08h,08h,08h,08h,08h,08h,00h,00h
			db 00h,00h,00h,06h,06h,00h,00h,06h,06h,00h,00h,00h

floor_start_y dw 190			

line_character dw ?
satan_x dw 153
satan_y dw 172


line dw ?


ball_x dw 153
ball_y dw 100
save dw ?
ball1Exist dw 5

rope_x dw 159 ; + six to the right so its in the middle
rope_y dw 168
flagS dw 0
ropeLen dw 207 ;start pixel until 0
hit db 0

delay dw 0FFFFh ;original: 2999h NOT IN USE

;directions
NEorNW db 0
NWorSW db 0
SWorSE db 1
NEorSE db 1

rightWall dw 293
floorLim dw 163

Pheight equ [bp+12]	
Pwidth equ [bp+10]
Pcolor equ [bp+8]
Py equ [bp+6]
Px equ [bp+4]

;lives
hearts dw 3
x_cord db 2
y_cord db 2
count db 3

CODESEG
proc OpenFile
;open file
mov ah, 3Dh
xor al, al
mov dx, offset filename
int 21h
jc openerror
mov [filehandle], ax

ret

openerror:
mov dx, offset ErrorMsg
mov ah, 9h
int 21h
ret
endp OpenFile
;--------------------
proc ReadHeader
;read BMP file header
mov ah,3fh
mov bx, [filehandle]
mov cx,54
mov dx,offset Header
int 21h
ret
endp ReadHeader
;--------------------
proc ReadPalette
;read BMP file color palette, 256 colors * 4 bytes (400h)
mov ah,3fh
mov cx,400h
mov dx,offset Palette
int 21h
ret
endp ReadPalette
;--------------------
proc CopyPal
;copy the colors palette to the video memory
mov si,offset Palette
mov cx,256
mov dx,3C8h
mov al,0

out dx,al

inc dx
PalLoop:
mov al,[si+2] ;get red value.
shr al,2
out dx,al
mov al,[si+1] ;get green value.
shr al,2
out dx,al
mov al,[si] ;get blue value.
shr al,2
out dx,al 
add si,4

loop PalLoop
ret
endp CopyPal
;--------------------
proc CopyBitmap
mov ax, 0A000h
mov es, ax
mov cx,200
PrintBMPLoop:
push cx
; di = cx*320
mov di,cx
shl cx,6
shl di,8
add di,cx
mov ah,3fh
mov cx,320
mov dx,offset ScrLine
int 21h

cld ;clear direction flag
mov cx,320
mov si,offset ScrLine


rep movsb

pop cx
loop PrintBMPLoop

ret
endp CopyBitmap
;--------------------
proc CloseFile
mov ah,3Eh
mov bx, [filehandle]
int 21h
ret
endp CloseFile
;--------------------
proc PrintGround
	push bp
	mov bp, sp
	
	mov dx, [bp+4]
allFloor:
	mov cx,0
fill_all_y:
	mov bl, 0
	mov al, 7h
	mov ah, 0Ch 
	int 10h
	
	inc cx
	cmp cx, 320
	jne fill_all_y
	inc dx
	cmp dx,200
	jne allFloor
pop bp
ret 2
endp PrintGround
;--------------------
proc PrintBall
	push bp
	mov bp, sp
	
	mov si, Pheight
	mov di, Pwidth
	mov bx, Pcolor
	mov dx, Py
	mov cx, Px
	
printPixel:
mov cx, Px
	mov di, Pwidth
	inc dx
	dec si
	row:

		mov al,[bx] ;yellow ball = each color value
		mov ah, 0Ch
		int 10h
		
		inc bx
		inc cx
		dec di
	
		cmp di, 0
		jne row
	 
	
	cmp si, 0
	jne printPixel

	pop bp
	ret 8
endp PrintBall
;--------------------
proc BallMovement
	push bp
	mov bp, sp
	
beginning:

mov di, [bp+6] ;width
mov si, [bp+4] ;height
mov cx, [ball_x]
mov dx, [ball_y]

printblack:
mov cx, [ball_x]
	mov di, [bp+6]
	inc dx
	dec si
	row1:
	
		mov al, 00h
		mov ah, 0Ch
		int 10h
		
		inc cx
		dec di
		
		cmp di, 0
		jne row1
	
	cmp si, 0
	jne printblack
	
	jmp dire
return:
	
	mov di, [bp+6] ;width
	mov si, [bp+4] ;height
	mov cx, [ball_x]
	mov dx, [ball_y]
	mov bx, offset active_ball 
	
	mov dx, [ball_y]
	
PixelPrint:
mov cx, [ball_x]
	mov di, [bp+6]
	inc dx
	dec si
	rows:
	
		mov al, [bx]
		mov ah, 0Ch
		int 10h
		
		inc bx
		inc cx
		dec di
		
		cmp di, 0
		jne rows
	
	cmp si, 0
	jne PixelPrint
	
jmp ending
;check direction
dire:	

	mov ax, [floorLim]
	cmp [ball_y], ax ; 175 is the floor 
	je WallS
	mov ax, [rightWall]
	cmp [ball_x], ax ; 305 is the right wall 
	je WallE
	cmp [ball_y], 100 ; 100 is the ceiling
	je WallN
	cmp [ball_x], 0 ; 0 is the left wall
	je WallW
	
	cmp [NEorNW], 1
	je WallS ;last hit
	
	
	cmp [NWorSW], 1
	je WallE ;last hit
	
	
	cmp [SWorSE], 1
	je WallN ; last hit
	 
	
	cmp [NEorSE], 1 
	je WallW ;last hit
	
	
WallN:
	mov [NEorNW], 0
	mov [SWorSE], 1
	
	;check if it hit the floor
	mov ax, [floorLim]
	cmp [ball_y], ax 
	je WallS
	
	;check if SW
	cmp [NWorSW], 1
	je SW
	
	jmp SE
	
WallS:
	mov [SWorSE], 0
	mov [NEorNW], 1
	
	;check if it hit the ceiling
	cmp [ball_y],100
	je WallN
	
	;check if NW
	cmp [NWorSW], 1
	je NW
	
	jmp DNE

WallE:
	mov [NEorSE], 0
	mov [NWorSW], 1
	
	;check if it hit the left wall 
	cmp [ball_x], 0
	je WallW
	
	;checks if NW
	cmp [NEorNW], 1
	je NW
	
	jmp SW

WallW:
	mov [NWorSW], 0
	mov [NEorSE], 1
	
	;check if it hit the right wall
	mov ax, [rightWall]
	cmp [ball_x], ax
	je WallE
	
	;checks if SE
	cmp [SWorSE], 1
	je SE
	
	jmp DNE
NW:
	;check if it hit the ceiling
	cmp [ball_y], 100
	je SW
	
	dec [ball_x]
	dec [ball_y]
	jmp return
	
SW:
	mov ax, [floorLim]
	cmp [ball_y], ax
	je NW
	
	dec [ball_x]
	inc [ball_y]
	mov [NWorSW], 1
	mov [SWorSE], 1
	jmp return
	
DNE:
	mov ax, [rightWall]
	cmp [ball_x], ax
	je NW
	
	inc [ball_x]
	dec [ball_y]
	jmp return
	
SE:
	mov ax, [rightWall]
	cmp [ball_x], ax
	je SW
	
	inc [ball_x]
	inc [ball_y]
	jmp return
	
ending:
	pop bp
	ret 4
		
endp BallMovement
;---------------------
proc charright
	push bp
	mov bp, sp
	
	cmp [satan_x], 308
	je fin1
	
	mov di, [bp+6] ;width
	mov si, [bp+4] ;height
	mov cx, [satan_x]
	mov dx, [satan_y]
printblack2:
mov cx, [satan_x]
	mov di, [bp+6]
	inc dx
	dec si
	row2:
	
		mov al, 00h
		mov ah, 0Ch
		int 10h
		
		inc cx
		dec di
		
		cmp di, 0
		jne row2
	
	cmp si, 0
	jne printblack2
	
	mov di, [bp+6] ;width
	mov si, [bp+4] ;height
	inc [satan_x]
	mov cx, [satan_x]
	mov bx, offset satan 
	
	mov dx, [satan_y]
	
satanPrint:
mov cx, [satan_x]
	mov di, [bp+6]
	inc dx
	dec si
	rowsa:
	
		mov al, [bx]
		mov ah, 0Ch
		int 10h
		
		inc bx
		inc cx
		dec di
		
		cmp di, 0
		jne rowsa
	
	cmp si, 0
	jne satanPrint

fin1:
	pop bp
	ret 4
endp charright
;------------------
proc charleft
	push bp
	mov bp, sp
	
	cmp [satan_x], 0
	je fin2
	
	mov di, [bp+6] ;width
	mov si, [bp+4] ;height
	mov cx, [satan_x]
	mov dx, [satan_y]
printblack3:
mov cx, [satan_x]
	mov di, [bp+6]
	inc dx
	dec si
	row3:
	
		mov al, 00h
		mov ah, 0Ch
		int 10h
		
		inc cx
		dec di
		
		cmp di, 0
		jne row3
	
	cmp si, 0
	jne printblack3
	
	mov di, [bp+6] ;width
	mov si, [bp+4] ;height
	dec	[satan_x]
	mov cx, [satan_x]
	mov bx, offset satan 
	
	mov dx, [satan_y]
	
satanPrint2:
mov cx, [satan_x]
	mov di, [bp+6]
	inc dx
	dec si
	rowsac:
	
		mov al, [bx]
		mov ah, 0Ch
		int 10h
		
		inc bx
		inc cx
		dec di
		
		cmp di, 0
		jne rowsac
	
	cmp si, 0
	jne satanPrint2
	
fin2:
	pop bp
	ret 4
endp charleft

proc shoot
	push bp
	mov bp, sp
	
	mov cx, [rope_x]
	mov dx, [rope_y]
	add dx, 4
	mov al, 00h
	mov si, 4
ropeTrail:
	mov bl, 0
	mov ah, 0Ch
	int 10h
	
	dec dx
	dec si
	
	cmp si, 0
	jne ropeTrail
	
	
	mov cx, [rope_x]
	mov dx, [rope_y]
	mov al, 07h
	mov si, 4
	
ropePrint:
	mov bl, 0
	mov ah, 0Ch
	int 10h
	
	dec dx
	dec si
	
	cmp si, 0
	jne ropePrint
	
	sub [rope_y], 4
	
	pop bp
	ret
endp shoot

proc delete
	push bp
	mov bp, sp
	
	mov cx, [rope_x]
	mov dx, [rope_y]
	mov al, 00h
	
ropeDelete:
	mov bl, 0
	mov ah, 0Ch
	int 10h
	
	dec dx
	
	cmp dx, 0
	jne ropeDelete

	pop bp
	ret
endp delete

proc touchRope
	push bp
	mov bp, sp
	
	mov di, [bp+6] ;width
	mov si, [bp+4] ;height
	mov bx, [ball_y]
	mov cx, [ball_x]
	
	
touchCheck:
mov cx, [ball_x]
	mov di, [bp+6]
	
	dec si
	shura:
	
		cmp cx, [rope_x]
		je checkY
		
	wasnt:
		inc cx
		dec di
		
		cmp di, 0
		jne shura
		inc bx
		
	cmp si, 0
	jne touchCheck
	jmp credits

checkY:
mov ax, [rope_y]
add ax, 4
inc ax
checkEach:
	dec ax
	cmp bx, ax
	je was
	
cmp ax, [rope_y]
jne checkEach
jmp wasnt
	
was:
	mov [hit], 1
	; open speaker
	in al, 61h
	or al, 00000011b
	out 61h, al
	
	; send control word to change frequency
	mov al, 0B6h
	out 43h, al
	
	; play frequency 131Hz
	mov ax, 2394h
	out 42h, al ; Sending lower byte
	mov al, ah
	out 42h, al ; Sending upper byte
	
	;delay
	mov cx, 1      ;HIGH WORD.
	mov dx, 07120h ;LOW WORD.
	mov ah, 86h    ;WAIT.
	int 15h
	
	; close the speaker
	in al, 61h
	and al, 11111100b
	out 61h, al

credits:
	mov [ropeLen], 207
	pop bp
	ret 4
endp touchRope
;------------------
proc Clear
	push bp
	mov bp, sp
	
	mov si, 26
	mov dx, Py
	mov cx, Px
	
printPixel2:
mov cx, Px
	mov di, 25
	inc dx
	dec si
	row4:

		mov al,0 
		mov ah, 0Ch
		int 10h
		
		inc cx
		dec di
	
		cmp di, 0
		jne row4
	 
	
	cmp si, 0
	jne printPixel2

	pop bp
	ret 4
endp Clear

start:
	mov ax, @data
	mov ds, ax
	
	;enter graphic mode
	mov ax, 13h
	int 10h
	
	;-----open screen-----
	
	;setting open screen
	call OpenFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	call CloseFile
	
	;wait for key press
	mov ah, 0h
	int 16h
	
checka:
	in al, 64h
	cmp al, 10b
	je checka
	in al, 60h
	cmp al, 2Eh
	je ctrl
	jmp rrr
	
ctrl:
	;enter graphic mode (clear screen)
	mov ax, 13h
	int 10h
	
	;set cursor location
	mov dh, 1
	mov dl, 1
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset ln1
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 3
	mov dl, 1
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset ln2
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 5
	mov dl, 1
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset ln3
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 9
	mov dl, 1
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset ln5
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 11
	mov dl, 1
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset ln6
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 13
	mov dl, 1
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset ln7
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 14
	mov dl, 1
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset ln8
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 18
	mov dl, 1
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset ln10
	mov ah, 9h
	int 21h
	
	;wait for key press
	mov ah, 0h
	int 16h
	
	jmp start
	
rrr:
	;enter graphic mode (clear screen)
	mov ax, 13h
	int 10h
	
	;setting the default ball
	xor di, di
	mov bx, offset green_ball
	mov cx, 650
	mov di, offset active_ball
reset1:
	mov dx, [bx]
	mov [di], dx
	inc di
	inc bx
	loop reset1
	
	mov ax, [green_height]
	mov [active_height], ax
	
	mov ax, [green_width]
	mov [active_width], ax
	
	mov [rightWall], 293
	mov [floorLim], 163
	
	mov [flagS], 0
	mov ax, [satan_y]
	sub ax, 4
	mov [rope_y], ax
	call delete
	;-----game start-----
	lives:
	
	;enter graphic mode (clear screen)
	mov ax, 13h
	int 10h
	
	mov [satan_x],153
	mov [satan_y], 172
	mov [ball_x], 153
	mov [ball_y], 100
	
	mov [x_cord], 2
	mov si, [hearts]
sethearts:
	inc [x_cord]
	;set cursor location
	mov dh, [y_cord] 	;row
	mov dl, [x_cord] 	;column
	mov bh, 0 		 	;page number
	mov ah, 2
	int 10h
	
	;draw heart
	mov ah, 9
	mov al, 3 ; heart
	mov bx, 4
	mov cx, 1
	int 10h
	dec si
	cmp si, 0
	jne sethearts
	
	;print ground
	push [floor_start_y]
	call PrintGround
	
	;print character
	mov [line_character], 12 ;width
	push 17 ;height
	push [line_character]
	push offset satan
	push [satan_y]
	push [satan_x]
	call PrintBall
	
	;print ball medium
	push [active_height] ;height
	push [active_width] ; width
	push offset active_ball
	push [ball_y]
	push [ball_x]
	call PrintBall
	
	;get ready for 1 sec
	mov ah, 2Ch
	int 21h
	
	cmp dh, 58
	je add2
	
	cmp dh, 59
	je add3
	
	mov [sec], dh
	add [sec], 2
	jmp back
	
add2:
	mov [sec], 0
	jmp back

add3:
	mov [sec], 1
	
back:
	;set cursor location
	mov dh, 9
	mov dl, 16
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset GR
	mov ah, 9h
	int 21h
	
CheckSec:
	mov ah, 2Ch
	int 21h

	cmp [sec], dh
	jne CheckSec
	
	;set cursor location
	mov dh, 9
	mov dl, 16
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset GR_2
	mov ah, 9h
	int 21h
	
	;print ball black
	push [active_height]
	push [active_width]
	push offset black_ball
	push [ball_y]
	push [ball_x]
	call PrintBall
	
;print ball medium movement and player
prints:

;set cursor location
	mov dh, 9
	mov dl, 12
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset RUSB
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 10
	mov dl, 12
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset RUSB
	mov ah, 9h
	int 21h
	
	;delay
	mov cx, 0      ;HIGH WORD.
	mov dx, 04920h ;LOW WORD.
	mov ah, 86h    ;WAIT.
	int 15h
	
	cmp [flagS], 1
	jne leftside
	
	;check if the rope has reached the ball
	mov bx, [ball_y]
	add bx, [active_height]
	cmp bx, [rope_y]
	jb leftside
	
	push [active_width]
	push [active_height]
	call touchRope
	
	cmp [hit], 1
	je split
	jmp leftside
	
split:
	dec [ball1Exist]
	mov [hit], 0
	jmp checkWin
	
leftside:
	checkL:
		mov bx, [ball_x]
		add bx, [active_width]
		cmp bx, [satan_x]
		jne rightside
		mov dx, 17
		mov ax, [ball_y]
		loopL:
			cmp ax, [satan_y]
			je point
			inc ax
			dec dx
			cmp dx, 0
			jne loopL
rightside:
	checkR:
		mov bx, [ball_x]
		sub bx, 12
		cmp bx, [satan_x]
		jne up
		
		mov cx, 17
		mov di, [ball_y]
		mov ax, [active_height]
		mov dx, 0 
		mov bx, 2
		div bx
		add ax, di
		mov si, [satan_y]
		dec si
	loopR2:
	add ax, di
	inc si
	
		loopR:
			cmp ax, si
			je point
			inc ax
			dec cx
			cmp cx, 0
			jne loopR
			
			cmp si, [floor_start_y]
			jnbe loopR2
			
			jmp up
		
up:
	checkU:
		mov bx, [ball_y]
		add bx, [active_height]
		cmp bx, [satan_y]
		jne continue
		mov dx, [active_width]
		mov ax, [ball_x]
		loopU:
			cmp ax, [satan_x]
			je point
			inc ax
			dec dx
			cmp dx, 0
			jne loopU
			
		mov dx, [active_width]
		mov ax, [ball_x]
		mov bx, [satan_x]
		add bx, 12
		loopU2:
			cmp ax, bx
			je point
			inc ax
			dec dx
			cmp dx, 0
			jne loopU2

continue:
	mov [delay], 0FFFFh
	push [active_width] ;width
	push [active_height] ;height
	call BallMovement

	in al, 64h
	cmp al, 10b
	je prints
	in al, 60h
	cmp al, 01h
	je ruSure
	cmp al, 4Dh
	je movright
	cmp al, 4Bh
	je movleft
	cmp [flagS], 1
	je space
	cmp al, 39h
	jne prints
	mov ax, [satan_x]
	add ax, 6
	mov [rope_x], ax
	mov [flagS], 1
	jmp space
	
movright:
	mov [delay], 1h
	mov [line_character], 17 ;height
	push 12 ;width
	push [line_character]
	call charright
	
	cmp [flagS], 1
	je space
	
	jmp prints

movleft:
	mov [delay], 1h
	mov [line_character], 17 ;height
	push 12 ;width
	push [line_character]
	call charleft
	
	cmp [flagS], 1
	je space
	
	jmp prints

space:
	cmp [rope_y], 0
	je deleteRope
	call shoot
	jmp prints
	
deleteRope:
	mov [flagS], 0
	mov ax, [satan_y]
	sub ax, 4
	mov [rope_y], ax
	call delete
	jmp prints
point:
	xor bx, bx
	dec [count]
	mov bl, [count]
	mov [hearts], bx
	
	cmp [hearts], 0
	je endgame
	
	;get ready for 1 sec
	mov ah, 2Ch
	int 21h
	
	cmp dh, 58
	je add4
	
	cmp dh, 59
	je add5
	
	mov [sec], dh
	add [sec], 2
	jmp back2
	
add4:
	mov [sec], 0
	jmp back2

add5:
	mov [sec], 1
	
back2:
	;set cursor location
	mov dh, 9
	mov dl, 16
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset TA
	mov ah, 9h
	int 21h
	
CheckSec2:
	mov ah, 2Ch
	int 21h

	cmp [sec], dh
	jne CheckSec2
	
	;set cursor location
	mov dh, 9
	mov dl, 16
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset GR_2
	mov ah, 9h
	int 21h

set2:
	;setting the default ball
	xor di, di
	mov bx, offset green_ball
	mov cx, 650
	mov di, offset active_ball
reset4:
	mov dx, [bx]
	mov [di], dx
	inc di
	inc bx
	loop reset4
	
	mov ax, [green_height]
	mov [active_height], ax
	
	mov ax, [green_width]
	mov [active_width], ax
	
	mov [rightWall], 293
	mov [floorLim], 163
	
	mov [ball1Exist], 5

jmp lives

checkWin:
	cmp [ball1Exist], 4
	je change2yellow
	
	cmp [ball1Exist], 3
	je change2red
	
	cmp [ball1Exist], 2
	je change2blue
	
	cmp [ball1Exist], 1
	je change2magneta
	
	
	;print ball medium black
	push [active_height]
	push [active_width]
	push offset black_ball
	push [ball_y]
	push [ball_x]
	call PrintBall
	
	call delete
	jmp gg

change2yellow:
	;print ball black
	push [ball_y]
	push [ball_x]
	call Clear
	
	;print character
	mov [line_character], 12 ;width
	push 17 ;height
	push [line_character]
	push offset satan
	push [satan_y]
	push [satan_x]
	call PrintBall
	
	;move to the middle
	add [ball_x], 6
	add [ball_y], 6
	;setting the yellow ball
	mov bx, offset yellow_ball
	mov cx, 169
	mov di, offset active_ball
reset2:
	mov dx, [bx]
	mov [di], dx
	inc di
	inc bx
	loop reset2
	
	mov ax, [yellow_height]
	mov [active_height], ax
	
	mov ax, [yellow_width]
	mov [active_width], ax
	
	mov [rightWall], 305
	mov [floorLim], 175
	
	mov [flagS], 0
	mov ax, [satan_y]
	sub ax, 4
	mov [rope_y], ax
	call delete
	
	;print ground
	push [floor_start_y]
	call PrintGround
	
	jmp leftside
	
change2blue:
	;print ball black
	push [ball_y]
	push [ball_x]
	call Clear
	
	;print character
	mov [line_character], 12 ;width
	push 17 ;height
	push [line_character]
	push offset satan
	push [satan_y]
	push [satan_x]
	call PrintBall
	
	;move to the middle
	add [ball_x], 1
	add [ball_y], 1
	
	;setting the blue ball
	mov bx, offset blue_ball
	mov cx, 81
	mov di, offset active_ball
reset3:
	mov dx, [bx]
	mov [di], dx
	inc di
	inc bx
	loop reset3
	
	mov ax, [blue_height]
	mov [active_height], ax
	
	mov ax, [blue_width]
	mov [active_width], ax
	
	mov [rightWall], 309
	mov [floorLim], 179
	
	mov [flagS], 0
	mov ax, [satan_y]
	sub ax, 4
	mov [rope_y], ax
	call delete

	;print ground
	push [floor_start_y]
	call PrintGround
	
	jmp leftside
	
change2red:
	;print ball black
	push [ball_y]
	push [ball_x]
	call Clear
	
	;print character
	mov [line_character], 12 ;width
	push 17 ;height
	push [line_character]
	push offset satan
	push [satan_y]
	push [satan_x]
	call PrintBall
	
	;move to the middle
	add [ball_x], 3
	add [ball_y], 3
	
	;setting the red ball
	mov bx, offset red_ball
	mov cx, 100 
	mov di, offset active_ball
reset5:
	mov dx, [bx]
	mov [di], dx
	inc di
	inc bx
	loop reset5
	
	mov ax, [red_height]
	mov [active_height], ax
	
	mov ax, [red_width]
	mov [active_width], ax
	
	mov [rightWall], 308
	mov [floorLim], 178
	
	mov [flagS], 0
	mov ax, [satan_y]
	sub ax, 4
	mov [rope_y], ax
	call delete
	
	;print ground
	push [floor_start_y]
	call PrintGround
	
	jmp leftside
	
change2magneta:
	;print ball black
	push [ball_y]
	push [ball_x]
	call Clear
	
	;print character
	mov [line_character], 12 ;width
	push 17 ;height
	push [line_character]
	push offset satan
	push [satan_y]
	push [satan_x]
	call PrintBall
	
	;move to the middle
	add [ball_x], 1
	add [ball_y], 1
	
	;setting the blue ball
	mov bx, offset magneta_ball
	mov cx, 49
	mov di, offset active_ball
reset8:
	mov dx, [bx]
	mov [di], dx
	inc di
	inc bx
	loop reset8
	
	mov ax, [magneta_height]
	mov [active_height], ax
	
	mov ax, [magneta_width]
	mov [active_width], ax
	
	mov [rightWall], 310
	mov [floorLim], 180
	
	mov [flagS], 0
	mov ax, [satan_y]
	sub ax, 4
	mov [rope_y], ax
	call delete

	;print ground
	push [floor_start_y]
	call PrintGround
	
	jmp leftside
	
gg:

	;set cursor location
	mov dh, 9
	mov dl, 16
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset VR
	mov ah, 9h
	int 21h
	
	;delay
	mov cx, 14      ;HIGH WORD.
	mov dx, 07120h ;LOW WORD.
	mov ah, 86h    ;WAIT.
	int 15h
	
	jmp exit
	
ruSure:
	;set cursor location
	mov dh, 9
	mov dl, 12
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset RUS
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 10
	mov dl, 12
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset RUS2
	mov ah, 9h
	int 21h
	
	in al, 64h
	cmp al, 10b
	je ruSure
	in al, 60h
	cmp al, 15h
	je endgame
	cmp al, 31h
	je prints
	jmp ruSure
	
endgame:

	;set cursor location
	mov dh, 9
	mov dl, 12
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset RUSB
	mov ah, 9h
	int 21h
	
	;set cursor location
	mov dh, 10
	mov dl, 12
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset RUSB
	mov ah, 9h
	int 21h
	
	;print ball black
	push [ball_y]
	push [ball_x]
	call Clear
	
	mov [flagS], 0
	mov ax, [satan_y]
	sub ax, 4
	mov [rope_y], ax
	call delete
	
	;set cursor location
	mov dh, 9
	mov dl, 16
	mov bh, 0
	mov ah, 2
	int 10h
	
	mov dx, offset GO
	mov ah, 9h
	int 21h
	
	;delay
	mov cx, 14      ;HIGH WORD.
	mov dx, 07120h ;LOW WORD.
	mov ah, 86h    ;WAIT.
	int 15h
	
	
exit:
mov ax, 4c00h
int 21h
END start
