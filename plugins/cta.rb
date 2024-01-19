class Cta < Bridgetown::Model::Base
  def resources_to_explore
    five_random_ctas.
      push(journal_resource).
      compact
  end

  private

  def five_random_ctas
    other_ctas.
      sample(5)
  end

  def other_ctas
    site_collections.
      ctas.
      resources.
      reject { |cta| cta.data.title == title }
  end

  def journal_resource
    site_collections.
      journals.
      resources.
      find { |journal| journal.data.clusters == clusters }
  end

  def event_resource
    site_collections.
      events.
      resources.
      find { |event| event.data.clusters == clusters }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end