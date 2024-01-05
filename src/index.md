---
---
<% events = collections.events.resources %>
<% clusters = collections.clusters.resources %>

<%= partial "landing/header" %>
<main class="min-w-[260px] max-w-[260px] md:max-w-[1550px] mx-auto mt-[40px]">
  <% PostHelpers.featured_collections(posts: clusters).each do |cluster| %>
    <%= render Cluster.new(site: site, cluster: cluster) %>
  <% end %>
</main>