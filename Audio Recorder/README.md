# Audio Recorder
## Objective
Prototype an audio recorder/player using the ANVYL FPGA Board.    The player must be implemented with picoBlaze soft microcontroller as the main controller.    The design should have the standard features of an audio recorder, namely, ability to record an audio message, play/pause/delete an audio message selected by the user from the audio library.  The user interface is through the Serial Terminal, push buttons, LEDS, and the dip switches.
### Design Requirements
The following are the design requirements:

R1) On start up, the system must show a welcome message and then display a menu
    1)	Play a message
    2)	Record a message
    3)	Delete a message
    4)	Delete all messages
    5)	Volume control

R2) For options 1 and 3 above, the system should display the audio library and the user should be able to scroll up or down in the list and then select it to play or delete.

R3) When the memory is full, the system should display a “MEMORY FULL” message.

R4) While playing an audio message, the user be able to pause/resume and skip the message.

R5) While a message is being played or recorded the user should be able to interact with the system through the menu.  In other words, the picoBlaze should not be tied up with playing/recording the message.

R6) The total record time should be at least 4 minutes.

R7) The recorder should be able to record/store atleast 5 messages of variable duration.

## Implementation
### System Block Diagram
The following system block diagram was used to implement the prototype.

![](/images/systemblockdiagram.jpg)

The following steps were followed:
1. Create a menu using picoblaze assembly that will be displayed on the PC screen. Remember to use a serial port monitor like PuTTY and set the correct port to receive and send data. See the program.psm above.
2. Run the .psm file into an assembler that returns program.v file
3. Create a new ISE project and start by adding Ram_interface.xise and ram_wrapper.v to the project using the *add source* option. This sets up inbuilt Ram.
4. Next we add sockit_top.v and associated files, followed by audio_rec_control.v and its associated files.
5. There is also a clock wizard that takes the clock input of 37.5MHZ and generates two different 100MHz clock frequencies for both the ram wrapper and the audio control. Be sure to select "no buffer" to ensure the generated clocks are outputted in parallel.
6. The audio codec file and audio effects had their own state diagram to regulate the quality of the audio and how the audio is routed within the board from the mic, stored in the RAM and outputted from the RAM. You can create your own state diagrams for this. for more info about audio codec module, please visit https://github.com/zhemao/rtaudio_effects/tree/part8 and https://zhehaomao.com/blog/fpga/2014/01/15/sockit-8.html
7. Lastly, add the Picoblaze.v file and its associated files, the rs232.v file and its associated rx and tx files. These files are responsible for communication of menu display on the serial monitor and returning the selected options to the audio recorder.

