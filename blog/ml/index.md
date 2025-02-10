---
layout: default
title: Machine Learning Blog
permalink: /blog/ml/
---

# Machine Learning Blog 🤖

{% assign ml_posts = site.posts | where: "category", "ml" %}
## Most Recent
{% if ml_posts.size > 0 %}
    {% for post in ml_posts reversed limit:3%}
- **[{{ post.title }}]({{ post.url }})** - *{{ post.date | date: "%B %d, %Y" }}*
    {{ post.excerpt }}
    {% endfor %}
{% else %}
  <p>No posts available.</p>
{% endif %}

## All Posts
{% if ml_posts.size > 0 %}
  {% for post in ml_posts reversed %}
- **[{{ post.title }}]({{ post.url }})** - *{{ post.date | date: "%B %d, %Y" }}*
    {{ post.excerpt }}
  {% endfor %}
{% else %}
  <p>No posts available.</p>
{% endif %}

