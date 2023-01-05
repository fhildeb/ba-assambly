# ba-assambly-course

HSMW Assambly Course from the University of Applied Science Mittweida in the subject
computer architecture that took place in 2018.

> **_NOTE:_** Commentary appears in German.

## Picture

![i8086 Emulator](./img/screenshot_assably.jpg)

## Session 1: Switch Blink

Displays the position of the individual switches on the LED line flashing.

## Session 2: LED and Display Behavior

1. Three adjacent LEDs flash visibly on the LED row.
2. On the LED row, alternate between LEDs in a pattern.
3. Illuminated LED wanders continuously from left to right in the row.
4. 0 and 1 are visibly displayed alternately on the 7-segment display.

## Session 3: Coordination and Frequency

1. All LEDs light up when certain switch is on.
2. On the LED row a single LED is wandering continuously back and forth.
3. LEDs flash when switch S0 is on, switch S7 control flashing frequency.
4. The state of the switches S3 and S4 displayed on the 7-segment display.
5. Simulation flashing car lights in different variations.

## Session 4: Storage and Display Reads

1. The memory range from 200H to 2FFH is overwritten with the value of the switch
   and copied over to 300-3FFH.
2. Program clearing all segments of the 7-segment display.
3. Shows the values of switches S3 to S0 in the display by having a hex table for digit convertion.
4. Dice Roll: When switch S0 is on, one digit is visibly but not recognizable counted between 1 and 6. If the switch is off, the display shows the last random value.

## Tools

- [i8086 Emulator](http://sourceforge.net/projects/i8086emu/): A multi-platform Emulator on SBC-86
