# Finite State Machine GCD Calculator
## Objective
To implement RTL Design (structural datapath and behavioral controller) of Greatest Common Denominator (GCD) of two numbers to be tested on FPGA board.

## Implementation
Design a GCD calculator for two 4-bit numbers. It will output the binary value of the greatest common divisor of those two 4-bit numbers. The numbers will be input via dip switches, the result will be output via LEDs, and control is done via push buttons.
1.	Input X via switches SW7-SW0 is the first number
2.	Input Y via switches DIP9-4 and DIP8-1 is the second number
3.	Input START uses pushbutton BTN0 (needs to be debounced)
4.	Input RESET uses pushbutton BTN3
5.	Output GCD_OUT uses LD7-LD0 for result of GCD
6.	Output DONE uses LD9, signal high when done

## Datapath
![](/images/gcdatapath.jpg)

## Results
GCD(12,4)

![](/images/gcd12-4.jpg)

GCD(12,15)

![](/images/gcd12-15.jpg)
