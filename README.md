# Kessessay

A small tool that shows some basic hardware specs of your Apple II.


**Website**  
http://fr3nch.t0uch.free.fr/

**Twitter**  
https://twitter.com/_Fr3nch_T0uch_


## Requirements

Any Apple II with at least 48kB of RAM and no CPU acceleration.


## Usage

Boot on the floppy disk.

Kessessay will display:

On II/II+/IIgs:
- The Apple II model

On IIe/IIc:
- The Apple II model
- The CPU version: 6502 or 65C02
- The system video frequency: 50Hz (PAL) or 60Hz (NTSC)
- Slots where a Mockingboard is detected (X if none found)

## Build instructions

You need the following tools:  
- acme cross-compiler  
- make (the GNU tool)  

### acme

https://sourceforge.net/projects/acme-crossass/
Add acme's path to the environment PATH variable. 

### make

On Linux, install the package that contains GNU make.

On Windows, the fastest way to install make is first to install the chocolatey package manager: 
https://chocolatey.org/  
Then open a shell as administrator and type:  
`choco install make`

### Build

Please change the needed paths in the makefile.

Then go to the root folder of the project in a shell and type:  
`make`

You will get a DSK file that works on any Apple II or Apple II emulator.
