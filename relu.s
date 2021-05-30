.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 is the pointer to the array
#	a1 is the # of elements in the array
# Returns:
#	None
# ==============================================================================
relu:
    # Prologue
    add t0, x0, x0

loop_start:
    beq t0, a1, loop_end
    addi t2, x0, 4
    mul t1, t0, t2
    add t2, t1, a0
    lw t3, 0(t2)
    bge t3, x0, loop_continue # if t3>0, go to loop_continue
    add t3, x0, x0
    sw t3, 0(t2)
    
loop_continue:
    addi t0, t0, 1
    j loop_start

loop_end:


    # Epilogue

    
	ret
