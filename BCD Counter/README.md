# BCD Counter
## Objective
Implement a BCD up-counter that counts until a certain maximum value.

## Implementation
Inputs: max_count[6:0], run, CLK

Outputs: Digit2[7:4], Digit1[3:0]

Switches SW[6:0] take an input (max_count) value which the bcd counter will count upwards to. 
Once the value is reached the counter stops and resets the value of the digits to 0.
Counting should only happen when RUN is enabled. The BCD value is output to the LEDS LED[7:0]. Switch SW[7] enables the clock. Note that since counting is done in 2 digit decimal, the maximum count (input) cannot be more than 99 or 1100011


