class Cluster::Heading < Bridgetown::Component
  def initialize(cluster:)
    @cluster = cluster
    @title = cluster.data.title
  end
end