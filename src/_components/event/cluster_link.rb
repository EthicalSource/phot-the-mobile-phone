class Event::ClusterLink < Bridgetown::Component
  def initialize(event:, cluster:)
    @event, @cluster = event, cluster
  end
end