---
layout: default
title: Photography
date: 2019-02-05 20:56:00 -0700
permalink: /photography
photos:
  - src: "7074sauber.jpg"
    caption: "Sauber Formula 1 Team (2018)"
    location: "Circuit of the Americas, Austin, Texas, US"
  - src: "6781seoul.jpg"
    caption: "Seoul from above"
    location: "서울,대한민국\nSeoul, South Korea"
  - src: "6710asakusa.jpg"
    caption: "浅草寺 (Sensoji)"
    location: "浅草、東京、日本\nAsakusa, Tokyo, Japan"
  - src: "6094crepuscular.jpg"
    caption: "Crepuscular rays"
    location: "Flushing, New York, US"
---

<div id="masonry" class="masonry">
{% for photo in page.photos %}
  <div class="item">
    <div class="content">
      <img src="/assets/photography/thumbnails/{{ photo.src }}" full-src="/assets/photography/{{ photo.src }}" alt="{{ photo.caption }}" location="{{ photo.location }}"/>
    </div>
  </div> {% endfor %}
</div>

<div id="modal" class="modal">
  <div class="modal-inner">
    <img id="modal-image" src="" alt=""/>
    <div class="info">
      <div class="title">
        <div id="caption"></div>
        <div id="location"></div>
      </div>
      <div class="shot-info">
        <div class="camera-info">
          <div id="camera-model"></div>
          <div id="lens-model"></div>
        </div>
        <div class="image-info">
          <div id="aperture"></div>
          <div id="shutter-speed"></div>
          <div id="focal-length"></div>
          <div id="iso"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="/assets/js/exif.js" async></script>
<script type="text/javascript">
(function() {
  function getExifData(imageNode, cb) {
    EXIF.getData(imageNode, function() {
      var exifData = EXIF.getAllTags(this);
      cb(exifData);
    });
  }

  document.getElementById('masonry').addEventListener('click', function(ev) {
      var target = ev.target;
      if (target.nodeName == "IMG") {
        var modalImage = document.getElementById('modal-image');
        if (modalImage.getAttribute('src') != target.getAttribute('full-src')) {
          document.getElementById('caption').innerText = "Loading";
          document.getElementById('location').innerText = "";
          document.getElementById('camera-model').innerText = ""
          document.getElementById('lens-model').innerText = ""
          document.getElementById('aperture').innerText = "";
          document.getElementById('focal-length').innerText = "";
          document.getElementById('iso').innerText = "";
          document.getElementById('shutter-speed').innerText = "";

          modalImage.setAttribute('src', target.getAttribute('full-src'));
          modalImage.setAttribute('alt', target.getAttribute('alt'));
          modalImage.exifdata = null;
        }
        document.getElementById('modal').className = "modal active";

        function onImageLoad() {
          getExifData(modalImage, function(exifData) {
            document.getElementById('caption').innerText = target.getAttribute('alt');
            document.getElementById('location').innerText = target.getAttribute('location');
            document.getElementById('camera-model').innerText = exifData.Model;
            if (exifData.LensModel == "EF-S18-135mm f/3.5-5.6 IS") {
              document.getElementById('lens-model').innerText = "Canon EF-S 18-135mm f/3.5-5.6 IS";
            } else {
              document.getElementById('lens-model').innerText = exifData.LensModel;
            }
            document.getElementById('aperture').innerText = "Aperture: f/" + Math.round(Math.pow(2, exifData.ApertureValue/2));
            document.getElementById('iso').innerText = "ISO: " + Math.round(exifData.ISOSpeedRatings);
            document.getElementById('focal-length').innerText = "Focal length: " + Math.round(exifData.FocalLength) + "mm";

            var shutterSpeed = Math.pow(2, exifData.ShutterSpeedValue)
            var shutterSpeedText = "Shutter speed: "
            if (shutterSpeed <= 1) {
              shutterSpeedText += Math.round((1/shutterSpeed) * 10) / 10;
            } else {
              shutterSpeedText += "1/" + Math.round(shutterSpeed);
            }
            shutterSpeedText += "s"
            document.getElementById('shutter-speed').innerText = shutterSpeedText;
          });
          modalImage.removeEventListener('load', onImageLoad);
        }

        if (modalImage.complete) {
          onImageLoad();
        } else {
          modalImage.addEventListener('load', onImageLoad)
        }
      }
  });

  function closeModal() {
    document.getElementById('modal').className = "modal";
  }

  document.getElementById('modal').addEventListener('click', function(ev) {
    if (ev.target.nodeName == "DIV" && ev.target.className == "modal-inner") {
      closeModal();
    }
  });

  var KEYCODE_MAP = {
    13: "ENTER",
    27: "ESC",
    32: "SPACE"
  };
  document.addEventListener('keyup', function(ev) {
    if (KEYCODE_MAP[ev.keyCode]) {
      closeModal();
    }
  });
})();
</script>
