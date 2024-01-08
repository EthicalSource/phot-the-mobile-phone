class Shared::Navbar < Bridgetown::Component
  def initialize(site:, resource:)
    @metadata = site.metadata
    @resource = resource
    @site     = site
  end

  def clusters
    site.collections.
      clusters.
      resources
  end

  def pages_in_nav
    site.collections.
      pages.
      resources.
      select { |page| page.data.in_nav }
  end
end
