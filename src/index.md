---
body_classes: ""
---
<% clusters = collections.clusters.resources %>
<% homeapge_intro = collections.general_content.resources
                  .detect { |gc| gc.data.name == "homepage_intro" } %>

<%= partial "landing/header" %>
<main class="container min-w-[260px] max-w-[1690px] mx-auto mt-[40px] mb-[100px] md:mb-[200px]">
  <div class="introduction">
    <%= markdownify homeapge_intro.content %>
  </div>
  <% PostHelpers.featured_collections(posts: clusters).each do |cluster| %>
    <%= render Cluster.new(site: site, cluster: cluster) %>
  <% end %>
</main>
<%= partial "shared/tell-your-story" %>

<script>
  if (window.netlifyIdentity) {
    window.netlifyIdentity.on("init", user => {
      if (!user) {
        window.netlifyIdentity.on("login", () => {
          document.location.href = "/admin/";
        });
      }
    });
  }
</script>