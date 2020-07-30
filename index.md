---
layout: default
---

I'm Patrick Tsai. Occasionally I blog here, most about software/electrical engineering projects.

I sometimes take photographs, and <a href="/photography">some of my favorite photography can be seen here</a>. It's mostly nature related.

<hr>

{% assign posts_by_date = site.posts | group_by_exp: "post", "post.date | date: '%B %e, %Y'" %}
{% for group in posts_by_date %}
  <h6>{{group.name}}</h6>
  <ul>
  {% for post in group.items %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
  </ul>
{% endfor %}
