/*
VR Toggle Box
2/2020 M.Dwyer 
*/
#define DCSBIOS_DEFAULT_SERIAL

#include "DcsBios.h"
#include "Adafruit_Keypad.h"
#include <SimpleRotary.h>
#include <Joystick.h>

// Define Rows and Cols for switch matrix
const byte ROWS = 5; // rows
const byte COLS = 5; // columns

byte mult = 0;

// Sequence of the buttons on the keypad matrix

char keys[ROWS][COLS] = {
  {4, 3, 2, 9, 10},
  {14, 13, 8, 7, 1},
  {20, 19, 18, 16, 15},
  {12, 11, 17, 6, 5},
  {24, 23, 22, 21, 0},

};

// Assign pins to matrix
byte rowPins[5] = {21, 20, 19, 18, 15};
byte colPins[5] = {14, 16, 10, 9, 8};

// Assign pins to rotary encoders
SimpleRotary rotary1(7, 6, 0);
SimpleRotary rotary2(5, 4, 0);
SimpleRotary rotary3(3, 2, 0);
SimpleRotary rotary4(0, 1, 0);

// Lookup tables used to specify which joystick buttons to toggle based on which button (1-25) is pressed.
// There are 3 lookup tables, each for one of the 3 modes selected by the mode selector switch

byte lut[3][25][2] = { { {3, 4}, {5, 6}, {7, 8}, {9, 10}, {11, 12},
    {13, 14}, {15, 14}, {16, 17}, {18, 17}, {19, 20}, {21, 20}, {22, 23}, {24, 23}, {25, 26}, {27, 26}, {0, 1}, {2, 1},
    {28, 255}, {29, 255}, {30, 255}, {31, 255}, {32, 255}, {33, 255}, {34, 35}, {36, 37}
  },

  { {44, 45}, {46, 47}, {48, 49}, {50, 51}, {52, 53},
    {54, 55}, {56, 55}, {57, 58}, {59, 58}, {60, 61}, {62, 61}, {63, 64}, {65, 64}, {66, 67}, {68, 67}, {0, 1}, {2, 1},
    {69, 255}, {70, 255}, {71, 255}, {72, 255}, {73, 255}, {74, 255}, {75, 76}, {77, 78}
  },

  { {85, 86}, {87, 88}, {89, 90}, {91, 92}, {93, 94},
    {95, 96}, {97, 96}, {98, 99}, {100, 99}, {101, 102}, {103, 102}, {104, 105}, {106, 105}, {107, 108}, {109, 108}, {0, 1}, {2, 1},
    {110, 255}, {111, 255}, {112, 255}, {113, 255}, {114, 255}, {115, 255}, {116, 117}, {118, 119}
  }

};

// Lookup tables for the rotary switches to map to joystick button. One for each mode. Rotary1 uses a hat switch, so the first 2 values in each of the 3 tables are in degrees
byte r_lut[3][8] = {
  {0, 45, 38, 39, 40, 41, 42, 43},
  {90, 135, 79, 80, 81, 82, 83, 84},
  {180, 225, 120, 121, 122, 123, 124, 125},
};

// Define names of switches for DCS bios and the value that is sent for on and off positions
const char *rots[] =
{
  "ROT1-CCW", "ROT1-CW",
  "ROT2-CCW", "ROT2-CW",
  "ROT3-CCW", "ROT3-CW",
  "ROT4-CCW", "ROT4-CW",
};

const char *cmds[][3] =
{
  { "1_SW1", "1", "0" }, { "1_SW2", "1", "0" }, { "1_SW3", "1", "0" }, { "1_SW4", "1", "0" }, { "1_SW5", "1", "0" },

  { "2_SW1", "2", "1" }, { "2_SW1", "0", "1" }, { "2_SW2", "2", "1" }, { "2_SW2", "0", "1" },
  { "2_SW3", "2", "1" }, { "2_SW3", "0", "1" }, { "2_SW4", "2", "1" }, { "2_SW4", "0", "1" },
  { "2_SW5", "2", "1" }, { "2_SW5", "0", "1" }, { "3_SW1", "2", "1" }, { "3_SW1", "0", "1" },

  { "3_SW2", "1", "0" }, { "3_SW3", "1", "0" }, { "3_SW4", "1", "0" }, { "3_SW5", "1", "0" },

  { "4_SW1", "1", "0" }, { "4_SW2", "1", "0" }, { "4_SW3", "1", "0" }, { "4_SW4", "1", "0" },
};



//initialize an instance of class NewKeypad
Adafruit_Keypad customKeypad = Adafruit_Keypad( makeKeymap(keys), rowPins, colPins, ROWS, COLS);

// Initialize instance of Joystick
Joystick_ Joystick(JOYSTICK_DEFAULT_REPORT_ID,
                   JOYSTICK_TYPE_JOYSTICK, 128, 2,
                   false, false, false, false, false, false,
                   false, false, false, false, false);

void setup() {

  DcsBios::setup();
  customKeypad.begin();
  Joystick.begin();
}

void loop() {

  DcsBios::loop();
  customKeypad.tick();

  switch (rotary1.rotate())
  {
    case 1:
      sendDcsBiosMessage(rots[0], "1");
      Joystick.setHatSwitch(0, r_lut[mult][0]); delay(50); Joystick.setHatSwitch(2, -1);
      break;
    case 2:  sendDcsBiosMessage(rots[1], "1");
      Joystick.setHatSwitch(0, r_lut[mult][1]); delay(50); Joystick.setHatSwitch(0, -1);
      break;
  }

  switch (rotary2.rotate())
  {
    case 1:
      sendDcsBiosMessage(rots[2], "1");
      Joystick.setButton(r_lut[mult][2], 1); delay(50); Joystick.setButton(r_lut[mult][2], 0);
      break;
    case 2:
      sendDcsBiosMessage(rots[3], "1");
      Joystick.setButton(r_lut[mult][3], 1); delay(50); Joystick.setButton(r_lut[mult][3], 0);
      break;
  }

  switch (rotary3.rotate())
  {
    case 1:
      sendDcsBiosMessage(rots[4], "1");
      Joystick.setButton(r_lut[mult][4], 1); delay(50); Joystick.setButton(r_lut[mult][4], 0);
      break;
    case 2:
      sendDcsBiosMessage(rots[5], "1");
      Joystick.setButton(r_lut[mult][5], 1); delay(50); Joystick.setButton(r_lut[mult][5], 0);
      break;
  }

  switch (rotary4.rotate())
  {
    case 1:  sendDcsBiosMessage(rots[6], "1");
      Joystick.setButton(r_lut[mult][6], 1); delay(50); Joystick.setButton(r_lut[mult][6], 0);
      break;
    case 2:  sendDcsBiosMessage(rots[7], "1");
      Joystick.setButton(r_lut[mult][7], 1); delay(50); Joystick.setButton(r_lut[mult][7], 0);
      break;
  }

  while (customKeypad.available()) {

    keypadEvent e = customKeypad.read();

    switch (e.bit.EVENT)
    {
      case KEY_JUST_PRESSED:
        sendDcsBiosMessage(cmds[e.bit.KEY][0], cmds[e.bit.KEY][1]);
        Joystick.setButton(lut[mult][e.bit.KEY][0], 1);
        Joystick.setButton(lut[mult][e.bit.KEY][1], 0);
        break;
      case KEY_JUST_RELEASED:
        sendDcsBiosMessage(cmds[e.bit.KEY][0], cmds[e.bit.KEY][2]);
        Joystick.setButton(lut[mult][e.bit.KEY][0], 0);
        Joystick.setButton(lut[mult][e.bit.KEY][1], 1);
        break;
    }

    if (e.bit.KEY == 16 && e.bit.EVENT == KEY_JUST_PRESSED) mult = 0;
    if (e.bit.KEY == 15 && e.bit.EVENT == KEY_JUST_PRESSED) mult = 2;
    if ((e.bit.KEY == 15 || e.bit.KEY == 16) && e.bit.EVENT == KEY_JUST_RELEASED) mult = 1;

  }

}
