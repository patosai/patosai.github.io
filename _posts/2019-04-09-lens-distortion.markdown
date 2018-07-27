---
layout: default
title:  'Lens Distortion'
date:   2019-04-09 08:40:00 -0700
permalink: /:categories/:title
---

Here is a demo showing the effects of lens distortion, found especially on zoom lenses. The photos here are taken with my Canon EF-S 18-135mm IS lens.

<hr>

<div class='center text-center'>
  <span id='lenschangetext'>Before</span> fixing lens distortion
</div>
<div class='center text-center'>
  <button id='changelenschange'>Toggle distortion</button>
</div>
<img class="img" id='lenschange' src='/assets/dslr/original.jpg' alt='Original image' />

<hr>

<div class='center text-center'>
  <span id='colorchangetext'>Before</span> adding brightness
</div>
<div class='center text-center'>
  <button id='changecolorchange'>Toggle brightness adj.</button>
</div>
<img class="img" id='colorchange' src='/assets/dslr/lensfix.jpg' alt='Color change' />

<script>
document.getElementById('changelenschange').onclick = function() {
  var lenschange = document.getElementById('lenschange')
  var text = document.getElementById('lenschangetext')
  if (lenschange.src.endsWith('original.jpg')) {
    lenschange.src = '/assets/dslr/lensfix.jpg'
    text.textContent = 'After'
  } else {
    lenschange.src = '/assets/dslr/original.jpg'
    text.textContent = 'Before'
  }
}

document.getElementById('changecolorchange').onclick = function() {
  var colorchange = document.getElementById('colorchange')
  var text = document.getElementById('colorchangetext')
  if (colorchange.src.endsWith('lensfix.jpg')) {
    colorchange.src = '/assets/dslr/final.jpg'
    text.textContent = 'After'
  } else {
    colorchange.src = '/assets/dslr/lensfix.jpg'
    text.textContent = 'Before'
  }
}
</script>
