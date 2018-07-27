---
layout: default
title:  Resolving no video signal after wake from Nvidia graphics card on Ubuntu 18.04 LTS
date:   2019-05-29 07:15:00 -0700
permalink: /:categories/:title
---

After installing the proprietary Nvidia 430.14 drivers on my Ubuntu 18.04 LTS installation, my monitor would have no signal after waking from sleep. Everything else was fine except for this. The solution was to rerun

{% highlight shell %}
sudo update-initramfs -u
{% endhighlight %}

Before running the above, I also blacklisted nouveau by putting the following lines in <code class="inline">/etc/modprobe.d/blacklist.conf</code>

{% highlight shell %}
blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off
{% endhighlight %}
