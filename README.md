# VR Toggle Box

<img align="left" src=images/front.jpg>

# Overview

The VR Toggle Box provides a VR friendly control surface with simultaneous joystick emulation and an optional DCS-BIOS interface. The device can be used to control switches and dials on any aircraft in Digital Combat Simulator via joystick controls or DCS-BIOS. It can also be used with any game that has a joystick interface that can support up to 120 different joystick buttons.

A mode switch to the left of the rotary encoders is selectable between 3 positions. Each position changes the mapping of the switches into different sets of joystick buttons or DCS-BIOS control messages. This provides up to 120 different control inputs. A typical setup might be to map the controls on mode 1 for aircraft startup and lights, 2 for nav/radios and 3 for weapons. 
 
The project includes:

* STL files for 3D printing the enclosure
* A circuit schematic for wiring the panel
* Code for programming an Arduino Pro Micro
* Customizable LUA scripts for DCS-BIOS to control any aircraft (coming soon)

# Build Parts List 
* QTY 7 - 2 Position Miniature Toggle Switch [Amazon](https://www.amazon.com/gp/product/B013DZB6CO/ref=ppx_yo_dt_b_asin_title_o01_s01?ie=UTF8&psc=1)
* QTY 6 - 3 Position Miniature Toggle Switch [Amazon](https://www.amazon.com/gp/product/B07RNX57ZM/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1)
* QTY 2 - 2 Pin SPST Momentary Mini Push Button Switch [Amazon](https://www.amazon.com/gp/product/B07SJ7RQL8/ref=ppx_yo_dt_b_asin_title_o01_s01?ie=UTF8&psc=1)
* QTY 4 - 5 pin 360 Degree Rotary Encoder with push button [Amazon](https://www.amazon.com/gp/product/B07DM2YMT4/ref=ppx_yo_dt_b_asin_title_o01_s01?ie=UTF8&psc=1)
* QTY 1 - Arduino Pro Micro board [Amazon](https://www.amazon.com/gp/product/B012FOV17O/ref=ppx_yo_dt_b_asin_title_o01_s01?ie=UTF8&psc=1)
* QTY 19 - 1N4004 diode (or most any diode) [Amazon](https://www.amazon.com/Poilee-1N4004-Rectifier-Electronic-Silicon/dp/B07CDCTZ8R/ref=sr_1_1_sspa?keywords=1N4004+diode&qid=1580868878&s=electronics&sr=1-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyWVVQQlJJQ1FHTlYxJmVuY3J5cHRlZElkPUEwMTcwOTk0MzNZWThIRDNEUEFQSCZlbmNyeXB0ZWRBZElkPUEwMDA4OTYwMlc1S0pWNk9MTU8zUiZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=)

# Enclosure and Wiring Build Notes

* The 3D model provides a top panel with 6mm holes. You may need to drill these slightly larger if you use different size switches. 
* The top panel is a snug fit into the base enclosure. You could optionally use an adhesive, but I haven't bothered.
* The direction of the diodes must match the schematic

# Building the Firmware

Required Arduino Libraries

* Adafruit Keypad [Github](https://github.com/adafruit/Adafruit_Keypad)
* Joystick Library [Github](https://github.com/MHeironimus/ArduinoJoystickLibrary)
* Simply Rotary [Github](https://github.com/mprograms/SimpleRotary)
* Arduino DCS-BIOS [Github](https://github.com/dcs-bios/dcs-bios-arduino-library)

# Mapping controls in DCS

Simple. VR Toggle Box will appear as a joystick controller so you can select a control and toggle a switch like with any joystick.

# Installing DCS-BIOS scripts

Still under development, but there are example files in the dcs-bios folder. 
After installing DCS-BIOS, you can connect to the VR-BOX from the DCS-BIOS Dashboard. 
Then, add vrbox.lua as a hub script. Currently, the P51-D is modeled fairly well along with a kneeboard file. There is also some start on the Viggen, F16 and F14. It should be straightforward how to edit vrbox.lua to map functions to different models.

** If you develop a mapping file, please share it! I would love to include it in this project.


