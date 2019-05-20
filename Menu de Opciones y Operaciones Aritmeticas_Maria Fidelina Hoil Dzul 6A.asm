;Instituto Tecnologico Superior de Valladolid
;Elaborado por: Maria Fidelina Hoil Dzul

;Menu de Opciones 
    

DATOS SEGMENT 
    
    ENCABEZADO DB 'MENU DE OPCIONES$'   
    OPERACIONES DB '[1] Operaciones Aritmeticas$' 
    MAYOR DB '[2] Mayor de tres numeros$'
    CALCULAR DB '[3] Calcular Hipotenusa$'
    SALIDA DB '[4] Salir$' 
    LINEA DB 13,10,'$'
    ;VAR1 DB 0
    ;VAR2 DB 0
     
    
    TEXT1 DB 'SE HA INGRESADO EN LA PRIMERA OPCION$'
    TEXT2 DB 'SE HA INGRESADO EN LA SEGUNDA OPCION$'
    TEXT3 DB 'SE HA INGRESADO EN LA TERCERA OPCION$' 
    TEXT4 DB 'SE HA SALIDO DEL PROGRAMA CON EXITO$'  
    
    NUM1 DB 'INGRESE EL PRIMER NUMERO:$'
    NUM2 DB 'INGRESE EL SIGUIENTE NUMERO:$'   
    
    SUM DB 'LA SUMA ES:$'
    RES DB 'RESTA$:'
    MULT DB 'MULTIPLICACION:$'
    DIVIDIR DB 'DIVISION:$'

       
    
DATOS ENDS

CODIGO SEGMENT 
    
    PROGRAMA PROC FAR
    ASSUME DS:DATOS,CS:CODIGO
    MOV AX,DATOS
    MOV DS,AX   
       
       CALL PANTALLA  
       CALL OP
       CALL FUNCION
    
    MOV AH,4CH
    INT 21H
     
     PROGRAMA ENDP   
    
    PANTALLA PROC NEAR
      
      ;RECORRER PANTALLA
    MOV AH,06H
    MOV AL,0
    MOV BH,5AH
    MOV CX,0000H
    MOV DX,184FH
    INT 10H 
         
    ;FONDO ENCABEZADO
    MOV AH,06H
    MOV AL,0
    MOV BH,4AH
    MOV CX,1510H
    MOV DX,0240H
    INT 10H    
    
    ;POSICION ENCABEZADO
    MOV AH,02H
    MOV BH,0
    MOV DH,02H
    MOV DL,20H
    INT 10H
    
    ;IMPRIME ENCABEZADO
    MOV AH,09H
    MOV DX,OFFSET ENCABEZADO
    INT 21H 
    
     RET
     
    PANTALLA ENDP  
    
    OP PROC NEAR
        
    ;****OPERACIONES**** 
    ;FONDO CAFE
    MOV AH,06H
    MOV AL,0
    MOV BH,6AH
    MOV CX,0510H
    MOV DX,1540H
    INT 10H  
   
    ;POSICION OPERACIONES
    MOV AH,02H
    MOV BH,0
    MOV DH,08H
    MOV DL,17H
    INT 10H 
    
    ;IMPRIMIR OPERACIONES 
    MOV AH,09H
    MOV DX,OFFSET OPERACIONES
    INT 21H 
    
    ;****MAYOR****
    ;POSICION MAYOR
    MOV AH,02H
    MOV BH,0
    MOV DH,0AH
    MOV DL,17H
    INT 10H 
    
    ;IMPRIMIR OPCION MAYOR
    MOV AH,09H
    MOV DX,OFFSET MAYOR
    INT 21H     
    
    ;****CALCULO****
    ;POSICION CALCULAR
    MOV AH,02H
    MOV BH,0
    MOV DH,0CH
    MOV DL,17H
    INT 10H
    
    ;IMPRIME OPCION CALCULAR
    MOV AH,09H
    MOV DX,OFFSET CALCULAR
    INT 21H 
    
    ;****SALIR****
    ;POSICION SALIDA
    MOV AH,02H
    MOV BH,0
    MOV DH,0EH
    MOV DL,17H
    INT 10H
    
    
    ;IMPRIME OPCION SALIR
    MOV AH,09H
    MOV DX,OFFSET SALIDA
    INT 21H  
    
    
    RET
    
    OP ENDP
    
    FUNCION PROC NEAR
    ;----MENU----
    MOV AH,08
    INT 21H
    
    MOV AH,00H
    INT 16H
    
    MENU:
    CMP AL,49
        JE ARITMETICA 
        
    CMP AL,50
        JE MAYOR_DE
                
    CMP AL,51
        JE HIPOTENUSA  
        
    CMP AL,52  
        JE EXIT
         
    CMP AL,53
        JE VOLVER
        
    VOLVER: 
    MOV AH,00H
    INT 16H
    
    MOV AH,05H
    MOV AL,0
    INT 10H
    
    JMP MENU  
    
    RET
    
    FUNCION ENDP              
         
    ;*************** 
   
   ARITMETICA PROC NEAR
    MOV AH,05H
    MOV AL,1 
    INT 10H 
    
    MOV AH,06H
    MOV AL,0
    MOV BH,5FH
    MOV CX,0000H
    MOV DX,184FH
    INT 10H 
    
    ;FONDO ENCABEZADO
    MOV AH,06H
    MOV AL,0
    MOV BH,3AH
    MOV CX,1510H
    MOV DX,0240H
    INT 10H      
    
    ;FONDO TEXT1
    MOV AH,06H
    MOV AL,0
    MOV BH,2AH
    MOV CX,0510H
    MOV DX,1540H
    INT 10H  
    
    ;POSICION TEXT1
    MOV AH,02H
    MOV BH,1
    MOV DH,02H
    MOV DL,17H
    INT 10H    
    
    CALL LIMPIAR 

    
    MOV AH,09H
    MOV DX,OFFSET TEXT1
    INT 21H 
    
    ;POSICION N1
    MOV AH,02H
    MOV AL,1 
    MOV DH,06H
    MOV DL,15H
    INT 10H
    
    MOV AH,09H
    MOV DX,OFFSET NUM1
    INT 21H 
    
     CALL LEER  
    
    MOV AH,02H
    MOV AL,1
    MOV DH,08H
    MOV DL,15H
    INT 10H
    
    MOV AH,09H
    MOV DX,OFFSET NUM2
    INT 21H 
    
    CALL LEER 
    
       
    MOV AH,02H
    MOV AL,1
    MOV DH,0AH
    MOV DL,15H
    INT 10H
    
    MOV AH,09H
    MOV DX,OFFSET SUM
    INT 21H 
    
    CALL SUMAR
   
    
    MOV AH,00H
    INT 16H
    
    MOV AH,05H
    MOV AL,0
    INT 10H
    
   
    RET
       
    ARITMETICA ENDP 
   
   ;PROCEDIMIENTOS 
   
   SALTO PROC NEAR  
    
    MOV AH,09H
    LEA DX,LINEA
    INT 21H

    MOV DL,00H
    RET
    SALTO ENDP
   
     LEER PROC NEAR  
        
      MOV AH,01H
      INT 21H
      
      RET 
      
     LEER ENDP 
     
     SUMAR PROC NEAR 
        
        MOV AH,05H

        MOV AL,1

        INT 10H



        MOV AH,01H

        INT 21H

        MOV NUM1,AL

        SUB NUM1,30H


       
        MOV AH,01H

        INT 21H

        MOV NUM2,AL

        SUB NUM2,30H

        
        MOV AH,0

        MOV AL,NUM1

        MOV BL,NUM2

        ADD AL,BL

        AAA       


        ADD AL,30H

        ADD AH,30H

        MOV NUM1,AH

        MOV NUM2,AL

     
        MOV AH,05H

        MOV AL,0

        INT 10H


        RET    
 
            
     SUMAR ENDP    
     
     LIMPIAR PROC NEAR
        
    MOV AH,00H
    MOV AL,03H
    INT 10H
    RET
     
     LIMPIAR ENDP   
          
   ;****************** 
    MAYOR_DE:
    MOV AH,05H
    MOV AL,2
    INT 10H
    
    MOV AH,06H
    MOV AL,0
    MOV BH,6FH
    MOV CX,0000H
    MOV DX,184FH
    INT 10H  
    
    ;FONDO ENCABEZADO
    MOV AH,06H
    MOV AL,0
    MOV BH,2AH
    MOV CX,1510H
    MOV DX,0240H
    INT 10H      
             
    ;FONDO TEXT2        
    MOV AH,06H
    MOV AL,0
    MOV BH,4AH
    MOV CX,0510H
    MOV DX,1540H
    INT 10H
     
    ;POSICION TEXT2
    MOV AH,02H
    MOV BH,2
    MOV DH,02H
    MOV DL,17H
    INT 10H
    
    MOV AH,09H
    MOV DX,OFFSET TEXT2
    INT 21H
    
    MOV AH,00H
    INT 16H 
    
    MOV AH,05H
    MOV AL,0
    INT 10H
    
    JMP MENU
    
    ;**************
    HIPOTENUSA:
    MOV AH,05H
    MOV AL,3
    INT 10H
    
    MOV AH,06H
    MOV AL,0
    MOV BH,8FH
    MOV CX,0000H
    MOV DX,184FH
    INT 10H   
                  
    ;FONDO ENCABEZADO
    MOV AH,06H
    MOV AL,0
    MOV BH,5AH
    MOV CX,1510H
    MOV DX,0240H
    INT 10H      
               
    ;FONDO TEXT3   
    MOV AH,06H
    MOV AL,0
    MOV BH,0BH
    MOV CX,0510H
    MOV DX,1540H
    INT 10H
    
    ;POSICION TEXT3
    MOV AH,02H
    MOV BH,3
    MOV DH,02H
    MOV DL,17H
    INT 10H
    
    MOV AH,09H
    MOV DX,OFFSET TEXT3
    INT 21H
    
    MOV AH,00H
    INT 16H 
    
    MOV AH,05H
    MOV AL,0
    INT 10H
    
    JMP MENU 
    
    ;************
    EXIT:
    MOV AH,05H
    MOV AL,4
    INT 10H
    
    MOV AH,06H
    MOV AL,0
    MOV BH,8FH
    MOV CX,0000H
    MOV DX,184FH
    INT 10H        
    
    ;FONDO TEXT4
    MOV AH,06H
    MOV AL,0
    MOV BH,2AH
    MOV CX,0510H
    MOV DX,1540H
    INT 10H
            
    ;POSICION TEXT4
    MOV AH,02H
    MOV BH,4
    MOV DH,0DH
    MOV DL,17H
    INT 10H
           
    MOV AH,09H
    MOV DX,OFFSET TEXT4
    INT 21H
    
    MOV AH,00H
    INT 16H
    
    MOV AH,05H
    MOV AL,0
    INT 10H    
    
    JMP MENU
      
    
    ;FINALIZAR PROGRAMA
    MOV AH,4CH
    INT 21H
    
    
CODIGO ENDS

END PROGRAMA