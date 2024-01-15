class Poster::Cluster < Bridgetown::Component
  def initialize(cluster:)
    @cluster = cluster.data
    @link = cluster.relative_url
    @carousel_description = @cluster.carousel_description.humanize
  end
end