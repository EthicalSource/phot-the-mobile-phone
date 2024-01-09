class Event < Bridgetown::Model::Base
  def resources_to_explore
    [ related_events,
      journal_resource,
      random_events,
      cta_resource
    ].flatten
     .compact
  end

  private

  def other_events
    site_collections.
      events.
      resources.
      reject { |event| event.data.title == title }
  end

  def related_events
    other_events.
      select { |event| event.data.clusters == clusters }.
      sample(2)
  end

  def random_events
    other_events.
      reject { |event| event.data.clusters == clusters }.
      sample(2)
  end

  def journal_resource
    site_collections.
      journals.
      resources.
      find { |journal| journal.data.clusters == clusters }
  end

  def cta_resource
    site_collections.
      ctas.
      resources.
      find { |cta| cta.data.clusters == clusters }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end