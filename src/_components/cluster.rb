class Cluster < Bridgetown::Component
  def initialize(site:, cluster:)
    @cluster = cluster
    @collection = cluster.data.title.downcase
    journals = site.collections.journals.resources
    events = site.collections.events.resources
    @events = PostHelpers.events_by_collection(posts: events, value: @collection)
    @journals = PostHelpers.journals_by_collection(posts: journals, value: @collection) || []
  end

  def render?
    @events.any?
  end
end