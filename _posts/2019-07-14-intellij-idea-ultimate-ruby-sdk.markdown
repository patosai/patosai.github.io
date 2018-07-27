---
layout: default
title:  Invalid home path error when adding a Ruby SDK in IntelliJ IDEA Ultimate 2019.1.3
date:   2019-07-14 10:15:00 +0800
permalink: /:categories/:title
---

I was having trouble adding a Ruby SDK to a Ruby IDEA project. When trying to add a local Ruby SDK to my project by adding the ruby executable inside my RVM folder, I would get an error like
<code>Error configuring SDK: [some classname here]. Please make sure that /home/user/.rvm/rubies/ruby-2.5.1/bin/ruby is a valid home path for this SDK type.</code>

The solution is to go to Plugins and enable the SSH Remote Run plugin. This also enables the Remote Hosts Access and Terminal plugins. After restarting the IDE, I was able to add the SDK.
