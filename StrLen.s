# read a line and find string length

main:
    la   $a0, str0       # printf("Enter a line of input: ");
    li   $v0, 4
    syscall

    la   $a0, line
    la   $a1, 256
    li   $v0, 8         # fgets(buffer, 256, stdin)
    syscall             #

	move $a1, $a0
	
	li $t0, 0			# Initialising counter to 0
	
do_loop:				# Finding String length in $t0
	lb $t1, 0($a0)
	beq $t1, $zero, next_part 	# terminates if string ending character reached
	
	addi $t0, $t0, 1	# Incrementing counter
	addi $a0, $a0, 1	# Incrementing address
	b do_loop
	
	
	
next_part:
	sub $t0, $t0, 1
	
	la   $a0, result
	li   $v0, 4
	syscall
	
    move $a0, $t0
    li   $v0, 1
    syscall

    li   $v0, 0          # return 0
    jr   $ra


.data
str0:
    .asciiz "Enter a line of input: "
result:
	.asciiz "\nNumber of characters in the string is: "

# line of input stored here
line:
    .space 256
