
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc'
org 100h

    call scan_num
    mov bx, cx
    call scan_num 
    call pascall
    call print_num 

    jmp exit
    
    
    proc pascall
        cmp cx, 0
        je returnone
        cmp bx, cx
        je returnone
        jmp label
        returnone:
            mov ax, 1
            ret
        label:
        dec bx
        push bx
        push cx
        
        call pascall
        
        pop cx
        pop bx
        dec cx
        
        push ax
 
        
        call pascall     
        
        pop dx
        add ax, dx
        
        ret
        
        pascall endp

 exit:       

ret
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS


