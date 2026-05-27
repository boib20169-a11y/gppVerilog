This project consisted of 3 stages in development: A normal processor, the processor with the ALU modified, the functionality
of the ALU modified to display yes or no for a given comparison. The normal processor consisted of a Control Unit which included
a functioning Moore FSM that cycles each of the 9 consecutive states and 4-16 Decoder implemented with two 3-8 decoders. It also
consisted of a positive level sensitive latches which was meant to store the last 4 digit of my student number for operation which 
were 42 and 51. This representation is in base 16. There were also the ALU which had 9 different functionalities such as
sum both A = 42 and B = 51, subtraction, complementation of A, the NAND of both A and B, and more Boolean operations.
Lastly there were 4 seven segment display for displaying: the current state which is decoded into the order of my student number from
the first one to the ninth. The other 2 segments displays the result of the ALU in hex since the ALU result is a 8 bit result which is 2
numbers in hex. The last segment is meant to display the negative sign upon one of the operation which is the subtraction of both 
A and B. Multiple test benches were used to ensure this stage fully worked with the waveforms found at the Waveforms folder
as a png file. The latest version of Vivado was used to write the code in Verilog. The demo was done in Basys 3.
The simulation test benches and design file is found under GPP.srcs. To run the same demo on the Basys 3 the same 
xdc file will have to be used provided in this repo.

The second stage just implements the ALU differently with different functionality such as rotation, shifting, inverting significance,
finding the min, and so on.

The third stage implements the whole processor differently with the two of the segments removed with only two remaining. One
of the segments is meant to display the current state decoded as the same ordering of my student number. The second segment
displays yes or no depending if one the digits of A = 42 is less than the current student number. 

Everything function properly after a few tweaks, debugging, and checks. The videos for each of the stages demo could be
found in this drive: https://drive.google.com/drive/folders/179-qpa-ajPAbaxFXqla3Ac9mFIZmWPay?usp=drive_link .

Before watching the video:
There were a bit of mistakes in what I said in the first demo for the ordering of the functionality.


