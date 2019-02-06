---
layout: default
---

<h3><a href="/about">About</a></h3>
<h3><a href="/photography">Photography</a></h3>

<h3>Projects</h3>
<ul>
  {% for post in site.posts %}
    {% if post.categories contains 'projects' %}
      <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
      </li>
    {% endif %}
  {% endfor %}
</ul>

<h3>Posts</h3>
<ul>
  {% for post in site.posts %}
    {% unless post.categories contains 'projects' %}
      <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
      </li>
    {% endunless %}
  {% endfor %}
</ul>
