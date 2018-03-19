# Joseph Shaffer
# CS 3340
# Homework 1
# Program prompts the user to enter 2 integers and the computes and prints their sum/

	.data 

Greeting: .asciiz "\nWelcome to MIPS! \n" 			# Greeting to user

Prompt1: .asciiz "\nGive me the first decimal number. \n" 	# prompt user for first integer

Prompt2: .asciiz "\nGive me the second decimal number. \n" 	# prompt user for second integer

out_string: .asciiz "\nThe sum of the two given numbers is: " 	# prints string for the sum

FirstInt: .word  0		# store the integer as a word
	
SecInt: .word 0			# store the integer as a word

TheSum: .word 0			# store the sum of the integers as the sum 

	.text

main:
	# Display the Greeting
	li $v0, 4		# Load instruction to "print String"
	la $a0, Greeting	# Load Greeting in $a0
	syscall
	
	# Display first prompt
	li $v0, 4		# Load instruction to "print String"
	la $a0, Prompt1		# Load prompt1 into $a0
	syscall
	
	# Read first integer
	li $v0, 5		# Read 1st integer
	syscall
	
	# Store first integer into memory
	sw $v0, FirstInt	# FirstInt = value at $v0
	
	# Display second prompt
	li $v0, 4		# Load instruction to "print String"
	la $a0, Prompt2		# Load prompt2 at $a0
	syscall
	
	# Read second integer
	li $v0, 5		# Read 2nd Integer
	syscall
	
	# Store second integer into memory
	sw $v0, SecInt		# SecInt = value at $v0
	
	# Add the two integers
	lw $t0, FirstInt	# load the 1st integer at $t0
	lw $t1, SecInt		# load the 2nd integer at $t1
	add $t2, $t1, $t0	# $t2 = $t1 + $t0
	sw $t2, TheSum		# TheSum = value at $t2
	
	# Display the out_string prompt
	la $a0, out_string	# Load instruction to "print String"	
	li $v0, 4		# Syscall to print string
	syscall
	
	# Display the sum
	lw $a0, TheSum		# $a0 = value at TheSum
	li $v0, 1		# Syscall to print integer
	syscall
	
	# Exit the program
	li $v0, 10		# Load the exit code at $v0
	syscall
	
# Terminate Program 
	
	
