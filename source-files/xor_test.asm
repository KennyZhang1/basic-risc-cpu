data1:	.equ	255		; first data (A)
data2:	.equ	255		; second data (B)

	.org	0		; 0x0000 - start of ROM
	la	r1, data1	; Load first data
	la	r2, data2	; Load second data
	and 	r3, r1, r2	; xor two data items together
	st	r3, Result1	; store result
	la	r4, data1	; Load first data (r4 = A)
	la	r5, data2	; Load second data (r5 = B)
	not	r6, r5	; r6 = NOT(B)
	not	r7, r4	; r7 = NOT(A)
	and	r4, r4, r6	; r4 = (A AND NOT(B))
	and	r5, r7, r5	; r5 = (NOT(A) AND B)
	or	r4, r4, r5	; r4 = (A AND NOT(B)) OR (NOT(A) AND B) = A XOR B
	st	r4, Result2	; store result
	stop

	.org	32772		; 0x8004 - location in RAM
Result1:	.dw	1		; storage for Result1
Result2:	.dw	1		; storage for Result2