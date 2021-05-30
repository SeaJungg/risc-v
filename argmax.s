.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 is the pointer to the start of the vector
#	a1 is the # of elements in the vector
# Returns:
#	a0 is the first index of the largest element
# =================================================================
argmax:

    # Prologue
    add t0, x0, x0
    addi t1, x0, 4
    lw t4, 0(a0)
    add t5, x0, x0

loop_start:
    beq t0, a1, loop_end
    mul t2, t1, t0
    add t2, t2, a0
    lw t3, 0(t2)
    ble t3, t4, loop_continue
    mv t4, t3
    mv t5, t0

loop_continue:
    addi t0, t0, 1
    j loop_start

loop_end:
    

    # Epilogue
    mv a0, t5

    ret
