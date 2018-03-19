# Joseph Shaffer
# CS 3340
# Computer Architecture 
# Homework 2
# This program allows the user to input an unsigned integer from 1 to 1000		
# The program then calculates the product of 2 times, 4 times, and 8 times that integer
# The program then prints out those calculations in a string

.data


Ask: .asciiz "\nEnter an unsigned integer from 1 to 1000: "	# Prompt to user
Is: .asciiz " is "						# String for the word 'is'
Result1: .asciiz "\nTwo times " 				# String for two times inputted integer
Result2: .asciiz ", four times "				# String for four times inputted integer
Result3: .asciiz " and 8 times "				# String for 8 times inputted integer
n: .word 0							# Store the integer as a word

.text


main:
	# Prompts the user for an integer
	li $v0, 4		# Load instruction to print string
	la $a0, Ask		# Load prompt in $a0
	syscall
	
	# Read inputted integer
	li $v0, 5		# Read integer
	syscall
	sw $v0, n		# Store integer in label n
	
	# Calculations
	addu $s0, $v0, $v0	# Calculates two times n
	
	addu $s1, $s0, $s0	# Calculates four times n
	
	addu $s2, $s1, $s1	# Calculates 8 times n
	
	# Display String for result
	li $v0, 4		# Load instruction to print string	
	la $a0, Result1		# Prints first part of result
	syscall
	
	lw $a0, n		# Loads inputted integer
	li $v0, 1		# Prints inputted integer in result
	syscall
	
	li $v0, 4		# Loads instruction to print string
	la $a0, Is		# Prints 'is' string into result
	syscall
	
	add $a0, $0, $s0	# $a0 = $s0
	li $v0, 1		# Prints two times n in result
	syscall
	
	li $v0, 4		# Load instruction to print string
	la $a0, Result2		# Prints second part of result
	syscall
	
	lw $a0, n		# Loads inputted integer
	li $v0, 1		# Prints inputted integer in result
	syscall
	
	li $v0, 4		# Loads instruction to print string
	la $a0, Is		# Prints 'is' string into result
	syscall
	
	add $a0, $0, $s1	# $a0 = $s1
	li $v0, 1		# Prints four times n in result
	syscall
	
	li $v0, 4		# Loads instruction to print string
	la $a0, Result3		# Prints third part of result
	syscall
	
	lw $a0, n		# Loads inputted integer
	li $v0, 1		# Prints inputted integer in result
	syscall
	
	li $v0, 4		# Loads instruction to print string
	la $a0, Is		# Prints 'is' string into result
	syscall
	
	add $a0, $0, $s2	# $a0 = $s2
	li $v0, 1		# Prints 8 times n in result
	syscall
	
	li $v0, 10		# Loads exit code at $v0
	syscall
# Terminate program