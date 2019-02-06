---
layout: default
title:  "jQuery Tree Multiselect Plugin"
date:   2018-07-27 12:48:35 -0700
permalink: /:categories/:title:output_ext
---

This is a simple replacement for select elements if you have nested/sectioned options. Rather than ramble on some more, I'll just show you the effect. You happen to be on a web page anyway.

The HTML.
{% highlight html %}
<select id="demo1" multiple="multiple">
  <option value="one" data-section="top" selected="selected" data-index="3">One</option>
  <option value="two" data-section="top" selected="selected" data-index="1">Two</option>
  <option value="three" data-section="top" selected="selected" data-index="2" data-description="A natural number">Three</option>
  <option value="four" data-section="top">Four</option>
  <option value="wow" data-section="top/inner/this/is/really/nested">Wow</option>
</select>
{% endhighlight %}

And the JavaScript.
{% highlight javascript %}
var params = { sortable: true };
$("select#demo1").treeMultiselect(params);
{% endhighlight %}

<select id="demo1" multiple="multiple">
  <option value="one" data-section="top" selected="selected" data-index="3">One</option>
  <option value="two" data-section="top" selected="selected" data-index="1">Two</option>
  <option value="three" data-section="top" selected="selected" data-index="2" data-description="A natural number">Three</option>
  <option value="four" data-section="top">Four</option>
  <option value="wow" data-section="top/inner/this/is/really/nested">Wow</option>
</select>

So how does this all work?

It takes the original select that you put in and hides it. Then it creates a double with the sweet UI that you see, and updates the select as you add/remove options. You can see that in the second demo, along with the search capabilities.

{% highlight javascript %}
$("select#demo2").treeMultiselect({searchable: true, searchParams: ['section', 'text']});
{% endhighlight %}

<select id="demo2" multiple="multiple">
  <option value="blueberry" data-section="Smoothies">Blueberry</option>
  <option value="strawberry" data-section="Smoothies">Strawberry</option>
  <option value="peach" data-section="Smoothies">Peach</option>
  <option value="milk tea" data-section="Bubble Tea" selected>Milk Tea</option>
  <option value="green apple" data-section="Bubble Tea" >Green Apple</option>
  <option value="passion fruit" data-section="Bubble Tea" selected readonly>Passion Fruit</option>
</select>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous">
</script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js">
</script>
<script src="/assets/projects/tree-multiselect/jquery.tree-multiselect.min.js">
</script>
<script>
$("select#demo1").treeMultiselect({ sortable: true });
$("select#demo2").treeMultiselect({searchable: true, searchParams: ['section', 'text']});
</script>
<link rel="stylesheet" href="/assets/projects/tree-multiselect/jquery.tree-multiselect.min.css" />
