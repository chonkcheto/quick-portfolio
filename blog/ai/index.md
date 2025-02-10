---
layout: default
title: Artificial Intelligence Blog
---

# Artificial Intelligence Blog 🧠

{% assign ai_posts = site.posts | where: "category", "ai" %}
## Most Recent
{% if ai_posts.size > 0 %}
    {% for post in ai_posts reversed limit:3%}
- **[{{ post.title }}]({{ post.url }})** - *{{ post.date | date: "%B %d, %Y" }}*
    {{ post.excerpt }}
    {% endfor %}
{% else %}
  <p>No posts available.</p>
{% endif %}

## All Posts
{% if ai_posts.size > 0 %}
  {% for post in ai_posts reversed %}
- **[{{ post.title }}]({{ post.url }})** - *{{ post.date | date: "%B %d, %Y" }}*
    {{ post.excerpt }}
  {% endfor %}
{% else %}
  <p>No posts available.</p>
{% endif %}

