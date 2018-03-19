# Joseph Shaffer
# Computer Architecture
# CS 3340
# Homework 5
# This program takes a positive integer and sums the individual decimal numbers of that positive integer.

	.data
	
	
Prompt: .asciiz "\nPlease enter a positive integer: "	
RPrompt: .asciiz "\nThe recursive subroutine is being called. \n"
IPrompt: .asciiz "\nThe iterative subroutine is being called. \n"
ansI: .asciiz "\nAnswer for iterative subroutine: "
ansR: .asciiz "\nAnswer for recursive subroutine: "


    .text

main:
    	li $v0, 4		# Load instruction to print string
	la $a0, Prompt		# Prompt to user
	syscall
	
	li $v0, 5		# Reads Integer inputted
	syscall
	
	move $a0, $v0    	#load number in $a0
	move $a2, $v0
	
	jal  Recursive       #call Recursive
	move $a1, $v0 	# set $a1 to result of recursion
	jal Iterative
	add $s0, $v0, $zero
	
	li $v0, 4		# Load instruction to print string
	la $a0, RPrompt		# Prompt for recursion
	syscall

	li $v0, 4		# Load instruction to print string
	la $a0, ansR		# String for answer to recursion
	syscall
	
	move $a0, $a1
    	
    	li  $v0, 1                           #set $v0 for print int system call
    	syscall
	
	li $v0, 4
	la $a0, IPrompt
	syscall
	
	li $v0, 4
	la $a0, ansI
	syscall
	
    	li $v0, 1
    	move $a0, $s0
    	syscall

    	li  $v0, 10                          #set $v0 for exit system call
    	syscall


Iterative:
	li $t1, 10
	div $a2, $t1
	mfhi $t2
	mflo $t3
	add $s0, $s0, $t2
	move $a2, $t3
	beq $t3, 0, Exit_Loop
	j Iterative
	
Exit_Loop: 
	move $v0, $s0
	jr $ra

#calculates sum of digits recursively
Recursive:

    sub     $sp, $sp, 12                  #alloocate 12B on stack
    sw      $ra, 0($sp)                      #save return address
    sw      $a0, 4($sp)                      #save argument

    beq     $a0, $0, Exit_Recursive      #when there is no more digits return 0
    rem     $t0, $a0, 10                  #get last digit
    sw      $t0, 8($sp)                      #save it on stack
    div     $a0, $a0, 10                  #divide argument by 10
    jal     Recursive                       #repeat procedure
    lw      $t0, 8($sp)                      #read digit from stack
    add     $v0, $v0, $t0             #add digit to previous result
    lw      $ra, 0($sp)                      #load return address
    addi    $sp, $sp, 12                  #free stack
    jr      $ra                             #return

Exit_Recursive:
    li      $v0, 0                           #there are no more digits, return 0
    lw      $ra, 0($sp)                      #load return address
    addi    $sp, $sp, 12                  #free stack
    jr      $ra                             #return



