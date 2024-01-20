class Journal < Bridgetown::Model::Base
  def resources_to_explore
    events.
      insert(2,other_journals.first).
      insert(4,prompt_resource).
      insert(5,cta_resource).
      compact
  end

  private

  def cta_resource
    site_collections.
      ctas.
      resources.
      find { |item| Array(item.data.clusters).map(&:downcase)
              .intersection(Array(clusters).map(&:downcase)) }
  end

  def events
    posts = site_collections.events.resources
    PostHelpers.events_by_collection(posts: posts, value: clusters, count: 2)
  end

  def prompt_resource
    site_collections.
      prompts.
      resources.
      find { |item| Array(item.data.clusters).map(&:downcase)
              .intersection(Array(clusters).map(&:downcase)) }
  end

  def other_journals
    site_collections.
      journals.
      resources.
      reject { |item| item.data.title == title }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end