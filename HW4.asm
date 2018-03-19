# Joseph Shaffer
# CS 3340
# Computer Architecture
# Homework 4
# This program repeatedly prompts the user for an amount in US dollar and prints the equivalent amount in Japanese Yen.

	.data

EndPrompt: .asciiz "\nTo end the program enter -1 when prompted for an amount.\n"	# Prompts user on how to end program
Prompt: .asciiz "\nEnter an amount in US Dollars: "					# Prompts user to enter amount in US dollars
Result: .asciiz "\nThe equivalent amount in Japanese Yen is: "				# Shows result in Japanese Yen
Space: .asciiz "\n"									# Prints empty line when called upon
n: .float 119.26									# Conversion rate of US dollar to Japanese Yen
n1: .float -1.0	
n2: .float 100.00			# Number to be called upon to terminate program, negative number because user cannot have a negative amount of cash
n3: .float 0.5

	.text
	
	li $v0, 4		# Load instruction to print string
	la $a0, EndPrompt	# Prompts user on what to enter to end program
	syscall
	
Loop:
	li $v0, 4		# Load instruction to print string
	la $a0, Prompt		# Prompt to user
	syscall
	
	li $v0, 6		# Reads Integer inputted
	syscall

	la $a0, n	# Loads address of 119.26 conversion rate variable into $a0
	l.s $f1, 0($a0)	# Loads 119.26 into single precision register
	
	la $a1, n1	# Loads address of -1 into $a1
	l.s $f2, 0($a1)	# Loads -1 into single precision register
	
	c.eq.s $f0, $f2	# Compares if inputted integer equals -1
	
	bc1t End	# Branches to terminate program if inputted integer is -1
	
	la $a2, n2		# Loads 100.00 into $a2 register
	l.s $f3, 0($a2)		# Load 100.00 into $f3 register
	la $a3, n3		# Loads 0.5 into $a3 register
	l.s $f4, 0($a3) 	# Loads 0.5 single precision into $f4
	
	mul.s $f12, $f1, $f0	# Multiply inputted integer by 119.26 to convert US to Yen
	
	# Calculations round the inputted value to the second decimal value if needed
	mul.s $f12, $f12, $f3	# Multiply inputted integer by 100.00
	add.s $f12, $f12, $f4	# Add 0.5 to $f12 to help round numbers
	cvt.w.s $f4, $f12	# Converts single point value to integer
	cvt.s.w $f12, $f4	# Converts integer to single point value
	div.s $f12, $f12, $f3	# Divides single point value by 100.00
	
	li $v0, 4	# Load instruction to print string
	la $a0, Result	# Prints out result
	syscall
	  
	li $v0, 2	# Load instruction to print single precision number
	syscall
	
	li $v0, 4	# Load instruction to print string
	la $a0, Space	# Prints a space in the print out of the result
	syscall
	
	j Loop		# Starts the Loop over again and prompts user for another value
	
End: 			# Terminates the program when End is called upon
	li $v0, 10
	syscall
	
# Terminate Program
