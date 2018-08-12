include inout.asm 
.model small,c
.486
.stack 2000h
.data
 zz db "enter the string $" 
 string db 300 dup(0)
 ww db  "number of charactar a = "
 sum dw 0

.code
 xxx : mov ax,@data 
       mov ds,ax
		
		call puts,offset zz 
		call gets,offset string 
		mov si,offset string 
        xor cx,cx 	
next:   cmp byte ptr [si],'$'
          JE finish     		
		  mov al, [si] 
		  cmp al, 'a'
		  JE count
		  ip = offset next  
		  
		  count: 
		  inc cx
		  mov sum,cx 
		  inc si 
		  
		  JMP next
		   
		  
		 finish:
		 call puts,offset ww 
		 call putint,sum
		
	    mov ah,04ch 
	    mov al,0 
	     int 21h
	   
	      end xxx
