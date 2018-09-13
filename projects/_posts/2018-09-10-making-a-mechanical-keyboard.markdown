---
layout: default
title:  "Making a Mechanical Keyboard"
date:   2018-09-10 20:40:00 -0700
permalink: /:categories/:title:output_ext
---

The first mechanical keyboard I bought was the Das Keyboard 4 Ultimate. I made the leap from regular rubber dome keyboards during my first summer in college after trying out some of my friends' keyboards and decided I liked the Das 4. I thought the $130 I paid then was already pretty high, but I was in for a shock when I saw the keyboards which had two halves, one for each hand. They claimed to be ergonomic, and must have been hard to manufacture as well given the 3D shape the circuit board had to accomodate! Nevertheless, $300+ keyboards were not for my taste and I decided to make my own.

How does a keyboard work?
---

Let us start with the basic switch. A keyboard consists of a number of keys, 101 in standard keyboards. Each key has a switch underneath which detects when you depress the key. Most of the cheap keyboards today use rubber dome switches, which look like this when you take the keycap off.

![an image of rubber dome](/assets/projects/ex2keyboard/exp-rubber-dome-grid.png)

You can see how the black conductor under the rubber domes will contact the black conductor fingers on the circuit when the domes are depressed.

There are also other kinds of switches, most notably the Cherry mechanical switches. If you've heard of MX Blue or MX Brown, these are the ones. Mechanical switches are larger and more complex but provide better feedback when depressing keys. 

WIP image here.

So there's 101 of these switches. Add a microcontroller so the keyboard can communicate over USB. But each switch can't be individually connected to the the microcontroller (most microcontrollers have less than 50 pins, and the ones that have >100 pins are super expensive and are loaded with other stuff).

![thinking image](/assets/projects/ex2keyboard/exp-switch-micro-wiring-many-how-can.png)

One solution is to use a matrix. Switches are connected to rows and columns, and each row or column is scanned one by one to see which keys are depressed or not.

WIP put some matrix image here.

One issue with using matrices is the ghosting problem. Ghosting is when keys show up as being pressed even though they were not, due to the physics of the matrix.

![circuit image of matrix](/assets/projects/ex2keyboard/exp-ghosting.png)

The green keys here are depressed. Say we scan the first row, and the columns are being read.

![matrix normal operation](/assets/projects/ex2keyboard/exp-ghosting-current.png)

So the first row was scanned, and it looks like there's current in the second column. Great, that's what was pressed! But here's what else could happen.

![matrix ghosting issue](/assets/projects/ex2keyboard/exp-ghosting-issue-current.png)

Current can also flow backwards through the row to get to the first column, so it looks like the key in the first row and first column is being pressed! This is the root of the ghosting problem. Current flows backwards through a path where it shouldn't be able to.

The ultimate fix is to have a diode with every switch to prevent any backwards current.

![ghosting issue fix](/assets/projects/ex2keyboard/exp-ghosting-fix.png)

And now things are working as intended. With this in mind, I set on designing my own keyboard.

WIP.
