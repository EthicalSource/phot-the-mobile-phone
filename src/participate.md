---
layout: default
---
<% explore_clusters = PostHelpers.explorable_collections(posts: collections.clusters.resources.each, value: nil) %>

<%= render Shared::Navbar.new(site: site, resource: resource) %>
<%= render Prompt::TypeForm.new() %>
<%= render Shared::Carousel.new(header_text: "Explore Collections") do %>
  <% explore_clusters.each do |explorable_cluster| %>
    <%= render Poster::Cluster.new(cluster: explorable_cluster) %>
  <% end %>
<% end %>
