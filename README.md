# Pwnagotchi Prince
After picking up the components to put together my own [pwnagotchi](https://pwnagotchi.ai/) I knew I wanted to make a fun case for it. Especially while using OpenScad and my 3D printer.

![render of pwnagotchi-prince](https://github.com/crashcartpro/pwnagotchi-prince/raw/master/pwn_prince_300px.png)

After many experiments, I was finally happiest with this design, loosely based on [The Prince](https://katamari.fandom.com/wiki/The_Prince) from Katamari.

## Software
Designed in OpenScad version 2015.03-3.
Individually printable parts are in their own modules.
Plus a few "sub-modules" for reusable shapes.

"output" is currently in two blocks at the end of the file. One for viewing how the completed model should fit together. The other for laying out all the parts for printing.

## Hardware
Designed for housing the stacked up:
- RaspberryPi 0w
- Waveshare 2.13in e-ink hat (v2)
- UPS-Lite (v1.0) battery pack

If you're really ambitious, the separate parts could be printed in different colors to better match the Prince of the Cosmos, or one of his cousins.

I did my best to keep "printability" in mind, but many parts will need to be printed with support material. In Cura, I tweaked `support X/Y distance` and `support horizontal Expansion` multiple pieces for easier printing

## Future Improvements
- [ ] Render full or partial set of STLs from a script
- [ ] Alternate parts or shims for alternate versions of hardware
- [ ] General improvements to fit and tolerances.
