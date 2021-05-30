.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 is the pointer to the start of v0
#   a1 is the pointer to the start of v1
#   a2 is the length of the vectors
#   a3 is the stride of v0
#   a4 is the stride of v1
# Returns:
#   a0 is the dot product of v0 and v1
# =======================================================
dot:

    # Prologue
    mv t0, a0
    add a0, x0, x0
    add t1, x0, x0
    addi t2, x0, 4
    mul a3, a3, t2
    mul a4, a4, t2

loop_start:
    beq t1, a2, loop_end
    mul t2, t1, a3
    mul t3, t1, a4
    add t4, t0, t2
    add t5, a1, t3
    lw t4, 0(t4)
    lw t5, 0(t5)
    mul t4, t4, t5
    add a0, a0, t4
    addi t1, t1, 1
    j loop_start

loop_end:


    # Epilogue

    
    ret
