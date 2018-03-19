# Joseph Shaffer
# CS 3340
# Computer Architecture
# Homework 3
# This program asks the user for an integer that corresponds to a weather condition and then the program returns with a suggestion 
# on what to do that day for the specified weather condition

	.data

Prompt: .asciiz "\nEnter an integer representing the weather condition for the day: \n1: Cloudy, 2: Raining, 3: Storm Coming: 4: Clear : "
Result1: .asciiz "\nDo not forget to bring an umbrella\n"
Result2: .asciiz "\nDo not go out\n"
Result3: .asciiz "\nCarry a pair of sunglasses with you\n"
Result4: .asciiz "\nThe integer entered does not correspond to a weather condition\n"

	.text
	
	li $v0, 4		# Load instruction to print string
	la $a0, Prompt		# Prompt to user
	syscall
	
	li $v0, 5		# Reads Integer inputted
	syscall
	
	
L1:				# First Loop compares if inputted integer = 1
	bne $v0, 1, L2		# if $v0 does not equal 1, the program moves to the second loop
	li $v0, 4		# Load instruction to print string
	la $a0, Result1		# Prints result 1 if inputted integer equals 1
	syscall
	j End			# After printing the result, the program jumps to terminate 
	
L2:				# Second Loop compares if the inputted integer equals 2
	bne $v0, 2, L3		# if $v0 does not equal 2, the program moves to the third loop
	li $v0, 4		# Load instructions to print string
	la $a0, Result1		# Prints result 1 (same as 1) if inputted integer equals 2
	syscall
	j End			# After printing the result, the program jumps to terminate 
	
L3:				# Third Loop compares if inputted integer = 3
	bne $v0, 3, L4		# if $v0 does not equal 3, the program will move to the third loop
	li $v0, 4		# Load instruction to print string
	la $a0, Result2		# Prints result 2 if inputted integer equals 3
	syscall
	j End			# After printing the result, the program jumps to terminate 
	
L4: 				# Fourth loop compares if inputted integer = 4
	bne $v0, 4, L5		# if $v0 does not equal 4, the program will move to the final loop
	li $v0, 4		# Load instructions to print string
	la $a0, Result3		# Prints result 3 if inputted integer equals 4
	syscall
	j End			# After printing the result, the program jumps to terminate 
	
L5:				# Loop in case user does not enter an integer that corresponds to a weather condition
	li $v0, 4		# Load instructions to print string
	la $a0, Result4		# Prints result 4 if the inputted integer does not equal 1, 2, 3, or 4
	syscall
	j End			# After printing the result, the program jumps to terminate 

End: 
	li $v0, 10		# Terminate Program
	syscall			
	
