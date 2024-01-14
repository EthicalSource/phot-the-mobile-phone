---
layout: default
---
<%= render Shared::Navbar.new(site: site, resource: resource) %>
<%= render Prompt::TypeForm.new() %>