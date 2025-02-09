---
layout: default
title: Bioinformatics Blog
---

# Bioinformatics Blog 🧬

Welcome to the Bioinformatics blog!

{% assign bioinformatics_posts = site.posts | where: "category", "bioinformatics" %}
## Most Recent
{% if bioinformatics_posts.size > 0 %}
    {% for post in bioinformatics_posts reversed limit:3%}
- **[{{ post.title }}]({{ post.url }})** - *{{ post.date | date: "%B %d, %Y" }}*
    {{ post.excerpt }}
    {% endfor %}
{% else %}
  <p>No posts available.</p>
{% endif %}

## All Posts
{% if bioinformatics_posts.size > 0 %}
  {% for post in bioinformatics_posts reversed %}
- **[{{ post.title }}]({{ post.url }})** - *{{ post.date | date: "%B %d, %Y" }}*
    {{ post.excerpt }}
  {% endfor %}
{% else %}
  <p>No posts available.</p>
{% endif %}
