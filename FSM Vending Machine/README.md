# Finite State Machine - Vending Machine
## Objective
Create a soda vending machine using a finite state machine model which takes dimes, nickels and quarters. Each soda (diet or regular) is 45c. Assume that the machine cannot take more coins once the 45c is reached. A drink should be dispensed and change given after the customer inserts at least 45c. After dispensing a drink, the vending machine return to reset state.

## Implementation
Inputs: qtr, nickel, dime, diet, soda, reset, CLK

Outputs: GiveSoda, GiveDiet, change, status

Create a FSM with every possible state. Since the lowest coin value is 5c, there should be at least 10 states to get to 45c, including the reset state S0. The maximum value the machine can take is 40c + 25c = 65c, assuming one inserts a quarter after inserting 40c. This brings the total to 14 states.

Create another FSM to calculate change and handle the status(i.e if done vending) and dispensing for each of the states.

## Finite State Machine (Moore's model) Table
![](/images/vendingFSM.jpg)

## Results
*For all cases, each input or output pulse is reflected for a full clock cycle. 4 dimes = 4 clock cycles. Change is in nickels therefore 20c = 4 clock cycles.*

Case 1: Input: Soda = 1, diet = 0, 3 dimes, 1 nickel; Output: Status = 0, Change = 0


![](/images/vendingtest1a.jpg)

Case 2: Input: Soda = 1, diet = 0, 4 dimes, 1 quarter; Output: Status = 1, Change = 20

![](/images/vendingtest1d.jpg)

