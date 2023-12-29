---
---
<% events = collections.events.resources %>
<% collections.clusters.resources.each do |cluster| %>
  <%= render Cluster.new(cluster: cluster, events: events) %>
<% end %>