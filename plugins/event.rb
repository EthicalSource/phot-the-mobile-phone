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
      select { |event| Array(event.data.clusters).map(&:downcase).
                intersection( Array(clusters).map(&:downcase)) }.
                sample(2)
  end

  def prompt_resource
    site_collections.
      prompts.
      resources.
      find { |item| Array(item.data.clusters).map(&:downcase).
              intersection(Array(clusters).map(&:downcase)) }

  end

  def journal_resource
    site_collections.
      journals.
      resources.
      find { |item| Array(item.data.clusters).map(&:downcase).
              intersection(Array(clusters).map(&:downcase)) }
  end

  def cta_resource
    binding.pry
    site_collections.
      ctas.
      resources.
      find { |item| Array(item.data.clusters).map(&:downcase)
              .intersection(Array(clusters).map(&:downcase)) }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end