require 'pry'
class Cluster < Bridgetown::Component
  def initialize(cluster:, events: [])
    @cluster = cluster.data.title.downcase
    @events = PostHelpers.events_by_collection(posts: events, value: @cluster)
  end

  def render?
    @events.any?
  end
end