---
body_classes: ""
---
<% events = collections.events.resources %>
<% clusters = collections.clusters.resources %>

<%= partial "landing/header" %>
<main class="min-w-[260px] max-w-[1550px] mx-auto mt-[40px]">
  <div class="px-5 flex gap-[20px] flex-col w-full md:w-3/5 my-[50px] mx-auto">
    <p>Join us in building a living artifact, sharing the human impact of technology, and harnessing our joint power for the future of tech citizenship.</p>
    <p>Our journey begins with the mobile phone, a pocket-sized marvel that has transformed our relationship with time, space and each other. How did we get here?</p>
    <p>We’ve seeded the timeline with key events and critical voices. Explore themes and <a class="underline">personal histories</a>, add <a class="underline">your story</a>, and <a class="underline">discover actionable steps</a> to ensure technology serves us all.</p>
  </div>
  <% PostHelpers.featured_collections(posts: clusters).each do |cluster| %>
    <%= render Cluster.new(site: site, cluster: cluster) %>
  <% end %>
</main>
<%= partial "shared/tell-your-story" %>
