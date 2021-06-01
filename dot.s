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
lw t0, 0(a0)
lw t1, 0(a1)
addi a2, a2, -1 #length - compare with index
mul t5, t0,t1
mv t6, x0 #i
mv t5, x0 #result

loop_start:

slli t2, t6, 2 # 4i
mul t0, t2, a3 #4i*S0
mul t1, t2, a4 #4i*S1
add t4, a0, t0# V0 + 4i*S0
add a6, a1, t1 # V1+ 4i*S1
lw t0, 0(t4)
lw t1, 0(a6)
mul a5, t0, t1
add t5, t5, a5
beq a2, t6, loop_end
addi t6, t6, 1


j loop_start



loop_end:

mv a0, t5

# Epilogue


ret