class Cluster::Highlight < Bridgetown::Component
  def initialize(cluster:)
    @cluster = cluster.data
  end

  def render?
    !@cluster.nil?
  end
end