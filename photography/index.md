---
layout: default
title: Photography
hide-title: true
permalink: /photography
photos:
  - src: "40californiastrain.jpg"
    caption: "California St. in the rain"
    location: "San Francisco, CA, US"
  - src: "39sunset.jpg"
    caption: "Sunset"
    location: "Lands End, San Francisco, CA, US"
  - src: "38sutrobaths.jpg"
    caption: "Sutro Baths"
    location: "Lands End, San Francisco, CA, US"
  - src: "37unionsquare.jpg"
    caption: "Union Square Great Tree"
    location: "San Francisco, California, US"
  - src: "36maiden.jpg"
    caption: "Alley"
    location: "San Francisco, California, US"
  - src: "35californiast.jpg"
    caption: "California St."
    location: "San Francisco, California, US"
  - src: "34goldengatebridge.jpg"
    caption: "Cloud Infrastructure"
    location: "San Francisco, California, US"
  - src: "33trolltunga.jpg"
    caption: "Trolltunga"
    location: "Odda, Norway"
  - src: "32fjords.jpg"
    location: "Norway"
  - src: "31floyen.jpg"
    caption: "Fløyen"
    location: "Bergen, Norway"
  - src: "30raven.jpg"
    location: "Arches National Park, Utah, US"
  - src: "29saltplain.jpg"
    location: "Arches National Park, Utah, US"
  - src: "28delicatearch.jpg"
    caption: "Delicate Arch"
    location: "Arches National Park, Utah, US"
  - src: "27pebbleroad.jpg"
    caption: "Pebbles"
  - src: "26balancedrock.jpg"
    caption: "Balanced Rock"
    location: "Arches National Park, Utah, US"
  - src: "25waimea.jpg"
    caption: "Waimea Canyon"
    location: "Kauai, Hawaii, US"
  - src: "24queensbath.jpg"
    caption: "Queen's Bath during stormy seas"
    location: "Kauai, Hawaii, US"
  - src: "23schilthornjackdaw.jpg"
    caption: "Jackdaw on the Schilthorn Piz Gloria"
    location: "Schilthorn, Switzerland"
  - src: "22peaks.jpg"
    caption: "View from Birg"
    location: "Mürren, Switzerland"
  - src: "21firstcliffwalk.jpg"
    caption: "First Cliffwalk"
    location: "Grindelwald, Switzerland"
  - src: "20icepalace.jpg"
    caption: "Ice Palace"
    location: "Jungfraujoch, Switzerland"
  - src: "19alestch.jpg"
    caption: "Alestch Glacier"
    location: "Jungfraujoch, Switzerland"
  - src: "18grindelwald.jpg"
    location: "Grindelwald, Switzerland"
  - src: "17eismeer.jpg"
    caption: "Eismeer Station"
    location: "Grindelwald, Switzerland"
  - src: "16eiffeltower.jpg"
    caption: "Eiffel Tower"
    location: "Paris, France"
  - src: "15arcdetriomphe.jpg"
    caption: "Arc de Triomphe"
    location: "Paris, France"
  - src: "14grandbassinrond.jpg"
    caption: "Grand Bassin Rond"
    location: "Paris, France"
  - src: "13pigeonstatue.jpg"
    location: "Paris, France"
  - src: "12louvre.jpg"
    caption: "Pyramide du Louvre"
    location: "Paris, France"
  - src: "11sauber.jpg"
    caption: "Sauber Formula 1 Team"
    location: "Circuit of the Americas, Austin, Texas, US"
  - src: "10intersection.jpg"
    caption: "City intersection"
  - src: "09skytree.jpg"
    caption: "Tokyo Skytree"
    location: "東京、日本\nTokyo, Japan"
  - src: "08asakusa.jpg"
    caption: "浅草寺 (Sensoji)"
    location: "東京、日本\nTokyo, Japan"
  - src: "07taipeimetro.jpg"
    caption: "Taipei metro station"
    location: "台北，台灣\nTaipei, Taiwan"
  - src: "06romesnow.jpg"
    caption: "Snow in Rome"
    location: "Rome, Italy"
  - src: "05crepuscular.jpg"
    caption: "Crepuscular rays"
  - src: "04locks.jpg"
    location: "Rome, Italy"
  - src: "03piazzadelpopolo.jpg"
    caption: "Piazza del Popolo"
    location: "Rome, Italy"
  - src: "02colosseum.jpg"
    caption: "Colosseum"
    location: "Rome, Italy"
  - src: "01sunset.jpg"
    caption: "Sunset"
---

<div class="grid" id="masonry">
  {% for photo in page.photos %}
    <div class="grid-item">
      <div class="content">
        <img id="{{ photo.src | split: "." | pop | join: "." }}" src="/assets/photography/thumbnails/{{ photo.src }}" full-src="/assets/photography/{{ photo.src }}" alt="{{ photo.caption }}" location="{{ photo.location }}"/>
      </div>
    </div>
  {% endfor %}
</div>

<div id="modal" class="modal">
  <svg id="modal-close" fill="white" viewBox="13.5 182.1094 166.2187 166.2186" width="100%" height="100%">
    <g>
      <path d="M179.7188 324.4219 L155.8125 348.3281 L96.6094 289.125 L37.4062 348.3281 L13.5 324.4219 L72.7031 265.2188 L13.5 206.0156 L37.4062 182.1094 L96.6094 241.3125 L155.8125 182.1094 L179.7188 206.0156 L120.5156 265.2188 L179.7188 324.4219 Z" stroke="none"/>
    </g>
  </svg>
  <div class="modal-inner">
    <div id="loading-spinner" class="loading-spinner" style="display: none">
      <div class="spinner-rect spinner-rect1"></div>
      <div class="spinner-rect spinner-rect2"></div>
      <div class="spinner-rect spinner-rect3"></div>
      <div class="spinner-rect spinner-rect4"></div>
      <div class="spinner-rect spinner-rect5"></div>
    </div>
    <div id="modal-image-wrapper" class="modal-image-wrapper">
      <div class="image-wrapper">
        <img id="modal-image" src="" alt=""/>
      </div>
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
</div>

<script type="text/javascript" src="/assets/js/exif.js" async></script>
<script type="text/javascript" src="/assets/js/masonry.pkgd.min.js"></script>
<script type="text/javascript">
(function() {
  function getExifData(imageNode, cb) {
    EXIF.getData(imageNode, function() {
      var exifData = EXIF.getAllTags(this);
      cb(exifData);
    });
  }

  function hideSpinner() {
    document.getElementById('loading-spinner').style.display = "none";
  }

  function showSpinner() {
    document.getElementById('loading-spinner').style.display = "";
  }

  function hideModalImageWrapper() {
    document.getElementById('modal-image-wrapper').style.display = "none";
  }

  function showModalImageWrapper() {
    document.getElementById('modal-image-wrapper').style.display = "";
  }

  function getImageFromParams() {
    return decodeURI(window.location.search)
      .replace('?', '')
      .split('&')
      .map(param => param.split('='))
      .reduce((values, [ key, value ]) => {
          values[ key ] = value
          return values
          }, {})
      .i
  }

  function setImageInParams(img) {
    if (window.history.pushState) {
      var newUrl = window.location.origin + window.location.pathname + "?i=" + encodeURIComponent(img);
      window.history.pushState({path: newUrl}, '', newUrl);
    }
  }

  function clearParams() {
    if (window.history.pushState) {
      var newUrl = window.location.origin + window.location.pathname;
      window.history.pushState({path: newUrl}, '', newUrl);
    }
  }

  function openModalWithTargetImageNode(target) {
    setImageInParams(target.id);
    var modalImage = document.getElementById('modal-image');
    if (modalImage.getAttribute('src') != target.getAttribute('full-src')) {
      document.getElementById('caption').innerText = "";
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
        } else if (exifData.LensModel) {
          document.getElementById('lens-model').innerText = exifData.LensModel;
        }
        document.getElementById('aperture').innerText = "f/" + Math.round(Math.pow(2, exifData.ApertureValue/2));
        document.getElementById('iso').innerText = "ISO " + Math.round(exifData.ISOSpeedRatings);
        document.getElementById('focal-length').innerText = Math.round(exifData.FocalLength) + "mm";

        var shutterSpeed = Math.pow(2, exifData.ShutterSpeedValue)
        var shutterSpeedText = "";
        if (shutterSpeed <= 1) {
          shutterSpeedText += Math.round((1/shutterSpeed) * 10) / 10;
        } else {
          shutterSpeedText += "1/" + Math.round(shutterSpeed);
        }
        shutterSpeedText += "s"
        document.getElementById('shutter-speed').innerText = shutterSpeedText;

        hideSpinner();
        showModalImageWrapper();
      });
      modalImage.removeEventListener('load', onImageLoad);
    }

    if (modalImage.complete) {
      hideSpinner();
      onImageLoad();
      showModalImageWrapper();
    } else {
      hideModalImageWrapper();
      modalImage.addEventListener('load', onImageLoad)
      showSpinner();
    }
  }

  document.getElementById('masonry').addEventListener('click', function(ev) {
    var target = ev.target;
    if (target.nodeName === "IMG") {
      openModalWithTargetImageNode(target);
    }
  });

  function closeModal() {
    document.getElementById('modal').className = "modal";
    clearParams();
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

  document.getElementById('modal-close').addEventListener('click', function(ev) {
    closeModal();
  });

  function initializeMasonry() {
    new Masonry( '#masonry', {
      columnWidth: '.grid-item',
      itemSelector: '.grid-item',
      percentPosition: true,
    });
  }

  window.onload = function() {
    initializeMasonry();

    var targetId = getImageFromParams();
    if (!targetId) {
      return;
    }

    var targetElement = document.getElementById(targetId);
    if (!targetElement || targetElement.nodeName !== "IMG") {
      clearParams();
      return;
    }

    openModalWithTargetImageNode(targetElement);
  }
})();
</script>
