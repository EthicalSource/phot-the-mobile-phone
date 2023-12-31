---
---
<% events = collections.events.resources %>
<% collections.clusters.resources.each do |cluster| %>
  <%= render Cluster.new(cluster: cluster, events: events) %>
<% end %>

<%= partial "landing/header" %>
<main class="w-[1550px] mx-auto">
  <%= partial "landing/prompt" %>
  <%= partial "landing/category-entry" %>
  <%= partial "landing/quote-entry" %>
  <%= partial "landing/double-entry" %>
  <%= partial "landing/tell-your-story" %>
  <%= partial "landing/take-action" %>
</main>