.data
    input: .asciiz "Digite o n�mero inteiro que deseja encontrar o fatorial: "
    output1: .asciiz "!"
    output2: .asciiz " = "
    error: .asciiz "N�mero negativo � inv�lido para este c�lculo!"
    .text
    .globl main

main:

    #imprime a mensagem solicitando o valor
    li $v0, 4                   #v0 n�mero 4: imprime uma string 
    la $a0, input		#imprime a string Output
    syscall			#chamada do sistema

    #recebe o valor
    li $v0, 5                   #v0 n�mero 5: v0 recebe um n�mero inteiro do terminal
    syscall			#chamada do sistema


    move $s0, $v0		#registrador s0 capta o valor de v0
    
    add $s3, $s0, $zero		#faz uma c�pia do valor de entrada (s3 = s0 + 0)
    
    bltz $s0, negativecase	#verifica se o n�mero s0 � negativo
    
    blt $s0, 2, exceptioncase	#verifica se o n�mero s0<2 (caso exce��o)  
    
    
    
    addi $s2, $s2, 1 		#s2 = 1, servir� de condi��o para sair do loop
    addi $s1, $s1, 1 		#s1 = 1, ser� o n�mero que ser� multiplicado at� o resultado final
    LOOP:    	
        mul $s1, $s1, $s0 	#s1 = s1 * s0
        subi $s0, $s0, 1 	#s0--
        bne $s0,$s2, LOOP 	#se s0!=1, volte para o loop
    
    #imprime o valor de entrada
    li $v0, 1
    move $a0, $s3
    syscall 
    
    #imprime "!"
    li $v0, 4
    la $a0, output1
    syscall 
    
    #imprime " = "
    li $v0, 4
    la $a0, output2
    syscall 
    
    #imprime resultado
    li $v0, 1
    move $a0, $s1
    syscall 

    #finaliza programa
    li $v0, 10    
    syscall
    
    exceptioncase:
    	#imprime o valor de entrada
    	li $v0, 1
    	move $a0, $s3
    	syscall 
        	
    	#imprime "!"
    	li $v0, 4
    	la $a0, output1
    	syscall 
    
    	#imprime " = "
    	li $v0, 4
    	la $a0, output2
    	syscall 
    
    	#imprime resultado
    	li $v0, 1
    	move $a0, $v0
    	syscall 

	#finaliza programa
    	li $v0, 10    
    	syscall
    
    
    
    negativecase:
    	#imprime mensagem de erro
    	li $v0, 4
    	la $a0, error
    	syscall 

	#finaliza programa
    	li $v0, 10    
    	syscall
