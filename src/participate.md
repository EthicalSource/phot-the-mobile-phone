---
layout: default
body_classes: "bg-black text-off-white"
---
<% explore_clusters = PostHelpers.explorable_collections(posts: collections.clusters.resources.each, value: nil) %>

<div class="px-[30px] lg:px-[70px]">
  <%= render Shared::Navbar.new(site: site, resource: resource) %>
</div>
<main class="px-[30px] lg:px-[70px] my-[40px]">
  <%= render Prompt::TypeForm.new() %>
</main>
<%= render Shared::Carousel.new(header_text: "Explore Collections") do %>
  <% explore_clusters.each do |explorable_cluster| %>
    <%= render Poster::Cluster.new(cluster: explorable_cluster) %>
  <% end %>
<% end %>
