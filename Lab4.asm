;Trevor Eby Lab4-311

;calculate the sum of all odd numbers
;between x3200 and x32FF inclusive.

.ORIG x3000

;get first value
;store it in register
;check if odd
;add to sum
;repeat

;CLEAR REGISTERS
AND R0, R0, #0 ;DIVIDEN
AND R1, R1, #0 ;
AND R2, R2, #0 ;OFFSET
AND R3, R3, #0 ;VALUE OF CURRENT MEMORY LOCATION
AND R4, R4, #0 ;CURRENT MEMORY LOCATION
AND R5, R5, #0 ;SUM
AND R6, R6, #0 ;
AND R7, R7, #0

;load the correct values into the correct registers
LD R4, FIRSTMEMLOC
LDI R0, FIRSTMEMLOC
LD R2, OFFSET
ST R4, CURRMEMLOC

;DIVIDE BY 2 depending on whether even or odd
IsEven
ADD R0, R0, #0
BRn IsNegative
BRp IsPositive
BRz LoopOver

;iterates throught the memory locations and updates the current memory postion
LoopOver
ADD R4, R4, #1
ST R4, CURRMEMLOC
LDI R0, CURRMEMLOC
ADD R2, R2, #-1
BRn Done
BRzp IsEven

;adds the current number to the sum if odd
AddToSum
LDI R3, CURRMEMLOC
ADD R5, R5, R3
BR LoopOver

;if positive, checks if its even or odd
IsPositive
ADD R0, R0, #-2
BRp IsPositive
BRz LoopOver
BRn AddToSum

;if negative, checks if its even or odd
IsNegative
ADD R0, R0, #2
BRn IsNegative
BRz LoopOver
BRp AddToSum

;after checking all memory locations, store sum and stop program
Done
STI R5, STOREMEMLOC
HALT

;VARIABLES
FIRSTMEMLOC .FILL x3200
CURRMEMLOC .FILL x3200
STOREMEMLOC .FILL x3300
OFFSET .FILL #255
.END