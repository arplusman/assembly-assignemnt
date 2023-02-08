
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc' 


org 100h
      call scan_num 
      
      
      
      push cx
      mov dx,13
  mov ah,2
  int 21h  
  mov dx,10
  mov ah,2
  int 21h
        
     pop cx 
      
       
      mov bx, 0
      mov ax, cx
      number:
      
        mov dx, 0
        div ten
        inc bx
        cmp ax, 0
        jg number
        
     push cx
     mov cx, bx
     pop bx
     mov dx, cx 
     mov ax, 100
     
     primeloop: 
            push cx
            push dx
            call prime
            pop dx
            pop cx
            cmp ax, 1
            je exit
            
            mov ax, bx
            mov dx, 0
            div ten
            push dx
            mul ten
            pop dx
            add ax, dx
            mov bx, ax 
            
            call print_num
           
            
            
            
            mov ax, bx
           
            
            loop primeloop
     mov ax, 0
     jmp exit   
     
     
     
    proc prime
           mov cx, bx
           dec cx
           modloop:
                cmp cx, 1
                jle exitloop
                mov ax, bx
                div cx 
                cmp dx, 0
                je returnone
                loop modloop 
                
                
                
                jmp exitloop
           returnone:
                mov ax, 1
                ret
          exitloop: 
                mov ax, 0
                ret 
                
                
                
       exit:
            cmp ax, 1
            je no
        
        
            PRINT 'YES'
            jmp end
       no:
            PRINT 'NO'
       end:
    

ret
    ten dw 10       
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS