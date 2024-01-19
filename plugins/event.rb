class Event < Bridgetown::Model::Base
  def resources_to_explore
    other_events.
      insert(2,journal_resource).
      insert(4,prompt_resource).
      insert(5,cta_resource).
      compact
  end

  private

  def other_events
    posts = site_collections.events.resources
    PostHelpers.events_by_collection(posts: posts, value: clusters, count: 30)
  end

  def related_events
    other_events.
      select { |event| event.data.clusters == clusters }.
      sample(2)
  end

  def prompt_resource
    site_collections.
      prompts.
      resources.
      find { |prompt| Array(prompt.data.clusters).flatten.
              map(&:downcase).include?(clusters.downcase) }
  end

  def journal_resource
    site_collections.
      journals.
      resources.
      find { |journal| Array(journal.data.clusters).flatten.
              map(&:downcase).include?(clusters.downcase) }
  end

  def cta_resource
    site_collections.
      ctas.
      resources.
      find { |cta| Array(cta.data.clusters).flatten.
              map(&:downcase).include?(clusters.downcase) }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end