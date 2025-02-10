---
layout: default
title: Dev Blog
---

# Welcome to my dev blog!

**(@Tiara, Insert some goals or intentions here)**

## Most Recent Posts
{% for post in site.posts reversed limit:3%}
- [**[{{post.category}}](/blog/{{post.category}})**] **[{{ post.title }}]({{ post.url }})** - *{{ post.date | date: "%B %d, %Y" }}*
    {{ post.excerpt }}
{% endfor %}

## Current Interests or Projects
### [Bioinformatics](/blog/bioinformatics)

I'm working through single-cell RNA sequencing and teaching myself
the workflows while also learning how to manage compute infrastructure for cheap.
Hopefully I'll be able to write this up into a learning resource for other
self-taught learners. At the moment there seems to be no free and in-depth
self-taught pathway. Most pathways obscure a lot of the details or expect you
to use paid resources; furthermore, most free resources require you to get
compute which adds another layer of complexity to the burgeoning
bioinformaticist.

### [Machine Learning](/blog/ml)

### [Artificial Intelligence](/blog/ai)