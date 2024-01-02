class Poster::Cluster < Bridgetown::Component
  def initialize(cluster:)
    @cluster = cluster.data
    @link = cluster.relative_url
  end
end