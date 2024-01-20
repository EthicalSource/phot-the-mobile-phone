class Cluster < Bridgetown::Component
  def initialize(site:, cluster:)
    @site, @cluster = site, cluster
    @collection = collection
    @events = filter_events
    @journals = filter_journals
    @prompts = filter_prompts
    @ctas = filter_ctas
  end

  def render?
    @events.any?
  end

  def collection
    @cluster.data.title.downcase
  end

  def filter_events
    posts = @site.collections.events.resources.sort_by { |p| p.data.start_date&.year }
    PostHelpers.events_by_collection(posts: posts, value: collection)
  end

  def filter_journals
    posts = @site.collections.journals.resources
    PostHelpers.journals_by_collection(posts: posts, value: collection)
  end

  def filter_prompts
    posts = @site.collections.prompts.resources
    PostHelpers.prompts_by_collection(posts: posts, value: collection)
  end
  
  def filter_ctas
    posts = @site.collections.ctas.resources
    PostHelpers.ctas_by_collection(posts: posts, value: collection)
  end
end