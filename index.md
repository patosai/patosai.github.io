---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---

<h3>Projects</h3>
<ul>
  {% for post in site.posts %}
    {% if post.categories contains 'projects' %}
      <a href="{{ post.url }}">{{ post.title }}</a>
    {% endif %}
  {% endfor %}
</ul>

<h3>Posts</h3>
<ul>
  {% for post in site.posts %}
    {% unless post.categories contains 'projects' %}
      <a href="{{ post.url }}">{{ post.title }}</a>
    {% endunless %}
  {% endfor %}
</ul>
