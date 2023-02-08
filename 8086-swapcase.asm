
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc'

org 100h
    call scan_num
    mov size, cx
    inc cx
    lea bx, string
     
    lea di, string
    mov dx, cx
    call get_string
    
    
    lea di, string
    mov cx, size
    mov si, di 
    add si, cx
    inc cx
    inc si
    change:
        dec si
        cmp [si], 'A'
        jge greaterthanca
        jmp continue
    greaterthanca:
        cmp [si], 'a'
        jge greaterthansa
        cmp [si], 'Z'
        jg continue
        sub [si], 'A'
        add [si], 'a'
        jmp continue
        
    greaterthansa:
        cmp [si], 'z'
        jg continue
        sub [si], 'a'
        add [si], 'A'
    continue:
        loop change
    exit:
       lea si, string
       call print_string 
            
    
        
ret 
    size dw 0
    string db 200 DUP(0)
    DEFINE_SCAN_NUM 
    DEFINE_GET_STRING
    DEFINE_PRINT_STRING