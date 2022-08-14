# Computer System Design Verilog Implementation
Verilog projects implemented using an Anvyl FPGA board and Xilinx ISE v14.7 in verilog.

Projects covered:

* BCD Counter
* Finite State Machine - Vending Machine
* Finite State Machine - GCD calculator with Datapath
* UART (RS232) Serial Message Transmission with Picoblaze Assembly

## How to Build Project
1. Clone the repository to a local directory of your choice
2. Open the Xilinx ISE Project file
3. A window may pop up asking you to select the location of specific files. All you need to do is select the file in the directory you just cloned to. If you do not get this window skip this step.
4. On the left side of your screen you will see a toolbar with options.

* *Design* tab shows the file hierarchy (most important for proper flow of the project). Within this tab you can choose simulation mode to simulate your project results using a testbench or the Implementation mode to implement the results on the board.
* *Processes* tab shows the running processes for both simulation and implementation
* You can also see a list of all your files and libraries in the *files* and *libraries* tab respectively

For more information on the Xilinx ISE Design Suite software, please visit https://www.xilinx.com

 
## 1. BCD Counter
### Objective
Implement a BCD up-counter that counts until a certain maximum value.

## Implementation
Inputs: max_count[6:0], run, CLK

Outputs: Digit2[7:4], Digit1[3:0]

Switches SW[6:0] take an input (max_count) value which the bcd counter will count upwards to. 
Once the value is reached the counter stops and resets the value of the digits to 0.
Counting should only happen when RUN is enabled. The BCD value is output to the LEDS LED[7:0]. Switch SW[7] enables the clock. Note that since counting is done in 2 digit decimal, the maximum count (input) cannot be more than 99 or 1100011

## 2. Finite State Machine - Vending Machine
### Objective
Create a soda vending machine using a finite state machine model which takes dimes, nickels and quarters. Each soda (diet or regular) is 45c. Assume that the machine cannot take more coins once the 45c is reached. A drink should be dispensed and change given after the customer inserts at least 45c. After dispensing a drink, the vending machine return to reset state.

### Implementation
Inputs: qtr, nickel, dime, diet, soda, reset, CLK

Outputs: GiveSoda, GiveDiet, change, status

Create a FSM with every possible state. Since the lowest coin value is 5c, there should be at least 10 states to get to 45c, including the reset state S0. The maximum value the machine can take is 40c + 25c = 65c, assuming one inserts a quarter after inserting 40c. This brings the total to 14 states.

Create another FSM to calculate change and handle the status(i.e if done vending) and dispensing for each of the states.

## 3. Finite State Machine GCD Calculator
### Objective
To implement RTL Design (structural datapath and behavioral controller) of Greatest Common Denominator (GCD) of two numbers to be tested on FPGA board.

### Implementation
Design a GCD for two 4-bit numbers (in your lecture notes, we have already done this). It will output the binary value of the greatest common divisor of those two 4-bit numbers. The numbers will be input via dip switches, the result will be output via LEDs, and control is done via push buttons.
1.	Input X via switches SW7-SW0
2.	Input Y via switches DIP9-4 and DIP8-1
3.	Input START uses pushbutton BTN0 (needs to be debounced)
4.	Input RESET uses pushbutton BTN3
5.	Output GCD OUT uses LD7-LD0
6.	Output DONE uses LD9


