---
layout: default
title:  "Dorm Room GSM Antenna"
date:   2015-03-01 12:00:00 -0500
permalink: /:categories/:title
---

{% include mathjax.html %}

*The original post is below, written in March 2015. A reflection on this project from April 2019 is at the bottom of the post.*

My dorm at Michigan was a little on the small side, but I'd say it was pretty good.

The problem was, there was no mobile signal. Which is a major problem if I want to call someone. &quot;Psh, who calls anyone anymore?&quot; you may say. Well I do. :)
<img class="img" src='/assets/projects/gsm/outdoors.jpg'/>

*There must be a way to get a little bit of signal into my room!* I thought. A popular method was to just put your phone right at the windowsill. But for whatever reason that didn't work for me.

So I visited the local Walgreens and got some aluminum (or aluminium, whichever country you're from) foil.
<img class="img" src='/assets/projects/gsm/cylinder.jpg'/>

I happened to have a cylindrical cardboard structure from the recent career fair (thank you Bloomberg for all the free swag).

My idea was something like this:
<img class="img" src='/assets/projects/gsm/ezsch1.jpg'/>

I'd line the Bloomberg with aluminum foil and stick it outside. All the radio waves from there would enter through one end and go out the other into my room, sort of like concentrating the radio waves. And hopefully my phone would get them on the other side.

But lining the inner layer of the Bloomberg was way too hard for me. So I tried it without the Bloomberg and it failed miserably.
<img class="img" src='/assets/projects/gsm/aluminum.jpg'/>

Well well, what to do now? I searched the web like usual, and realized that I could also use wire. Well, I happened to have wire on hand.
<img class="img" src='/assets/projects/gsm/wire1.jpg'/>

The thing is, it wasn't solid core. It had multiple strands (like most wire).

This is multi-strand wire (in fact this is the above wire, stripped):
<img class="img" src='/assets/projects/gsm/wire2.jpg'/>

Solid-core wire has a single strand that's a lot more malleable:
<img class="img" src='/assets/projects/gsm/wire3.jpg'/>

For these purposes I don't think there's much difference between solid and stranded antennas, but I went with solid core because I wanted to bend it easily.

Anyway, after a very long while searching through material, I finally built this antenna.
<img class="img" src='/assets/projects/gsm/antennasimple.jpg'/>

It was just a matter of stripping the wire completely and then bending it into shape.

It's about 3.3 inches on each edge of the square. In order to receive radio waves in a certain frequency your antenna needs to be of a certain length (the speed of light divided by the frequency in Hz). T-Mobile runs on 1700Mhz (and 2100Mhz but that's a different story), so the wavelength is 3e8 m/s divided by 1.7e9 Hz which gives about 17.65cm or 6.95 inches.

But you don't have to build your antenna to that length. You can build a full-, half-, or quarter-length antenna at the cost of the signal filtering. For me it didn't seem too much of a problem, so I built the half-wave size which turned out to be around 3.3-3.4 inches.

After soldering around a bit, I ended up with this.
<img class="img" src='/assets/projects/gsm/antenna.jpg'/>

I wanted to put this antenna outside, so I decided to put that atenna on some sort of block to support it. I thought aluminum foil and some random cardboard make a good combo, so I went with that.
<img class="img" src='/assets/projects/gsm/foil.jpg'/>
<img class="img" src='/assets/projects/gsm/antennacomplete.jpg'/>

I just used some other wire to hold the antenna in place.

When I first tried taping the antenna to the brick wall outside with packaging tape, it didn't stick. So I ran to get some duct tape - gummy bear patterned duct tape in fact (they didn't have the regular gray one).
<img class="img" src='/assets/projects/gsm/antennaoutside.jpg'/>

Looks like a children's toy mirror from some distance away. But I'm cool with that.

Here are some close ups of the setup.
<img class="img" src='/assets/projects/gsm/antennaflash.jpg'/>
<img class="img" src='/assets/projects/gsm/outsidewiring.jpg'/>

I managed to stick the wire through my window - and the window still closed tightly shut! When I first put the other end of the wire (stripped of course) against the back of my phone, I finally got some signal.
<img class="img" src='/assets/projects/gsm/signal1.jpg'/>

Hooray! But why stop there?
<img class="img" src='/assets/projects/gsm/wires.jpg'/>

I decided to make a "case" out of some more cardboard so I could just lay my phone on it and the wire.
<img class="img" src='/assets/projects/gsm/case.jpg'/>

In fact, I didn't even need to place the wire directly on the back of my phone; I stripped the wire to the 3.3-3.4 inch length above so my phone has signal anywhere in my room.
<img class="img" src='/assets/projects/gsm/signal2.jpg'/>

Pretty good I'd say, for a super cheap job! My antenna was nowhere near perfect either - all four sides were curving a bit. I guess they were straight enough for physics to work!
h3 Update - March 27

Today the antenna didn't seem to be working. So I went outside to see why that might be.
<img class="img" src='/assets/projects/gsm/cut.jpg'/>

Well then. It appears my antenna has been unceremoniously cut from its rightful place on the walls of the residence hall!

Ok just kidding, I guess I broke some rule and they took it down just because. Oh well.

<hr>

*A reflection from April 2019*

Little did I know at the time that my original aluminum foil cylinder idea was actually a cylindrical waveguide, a radius of about 0.05m which would give a cutoff frequency of about 1.7GHz. The 4G LTE bands that are used by T-Mobile mostly are Band 4, approximately 1700/2100MHz. Thankfully the cylinder cutoff frequency is around that, giving that idea a chance.

The issue is that the grid outside my window was fine enough to act as something like an electromagnetic wave barrier. It's something like what's in front of your microwave. The grid in your microwave isn't for structural support, it's a waveguide that has been made small enough so the cutoff frequency is higher than the frequency of the microwaves (about 2.4GHz).

The formula for cutoff frequency in a rectangular microwave is

$$f_{cutoff} = \frac{1}{2\sqrt{\mu\epsilon}}\sqrt{\left(\frac{m}{a}\right)^2 + \left(\frac{n}{b}\right)^2}$$

where $$a$$ and $$b$$ are the length and width of the waveguide, and $$m$$ and $$n$$ denote the mode of propagation. The dominant mode of propagation, $$m=n=1$$, gives the lowest cutoff frequency and is called the $$\text{TE}_{11}$$ mode. Assuming the microwave grid is square, that means to meet the 2.4Ghz minimum frequency requirement, that $$a=b\geq8.8\text{cm}$$. The grid is certainly smaller than that and so will result in a higher cutoff frequency. Below the cutoff frequency, the waves decay within the waveguide exponentially. That's probably what the grid outside the dorm window would have done.

The plan I proceeded with at the time was something like a rhombic antenna or a folded dipole that wasn't really folded. I had thought that adding aluminum foil would allow for better reception since maybe the waves would reflect off the foil and go into the antenna somehow, but what that was actually doing was adding something like a ground plane right under the antenna which is a no-no! Besides the probably mismatched impedance of the antenna to the single-wire transmission line, having a ground plane absolutely kills antenna sensitivity. If you imagine currents traveling in the antenna, those currents emit electric fields which reach the surrounding medium including the ground plane, and will induce currents in the ground plane to cancel out that E field at the surface of the plane. The superposition of those fields is a very weak electric field, especially if the antenna is close to the ground plane like it was. And because of reciprocity, an antenna's transmission characteristics are exactly the same as its reception characteristics. So a poor transmitter equals a poor receiver.

I'm surprised this worked at all.
