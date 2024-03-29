class Cta < Bridgetown::Model::Base
  def resources_to_explore
    other_ctas.
      insert(2,journal_resource).
      insert(4,prompt_resource).
      insert(5,cta_resource).
      compact
  end

  private

  def other_ctas
    site_collections.
      ctas.
      resources.
      reject { |cta| cta.data.title == title }.take(2)
  end

  def cta_resource
    site_collections.
      ctas.
      resources.
      find { |item| Array(item.data.clusters).map(&:downcase)
              .intersection(Array(clusters).map(&:downcase)) }
  end

  def journal_resource
    site_collections.
      journals.
      resources.
      find { |item| Array(item.data.clusters).map(&:downcase).
              intersection(Array(clusters).map(&:downcase)) }
  end

  def prompt_resource
    site_collections.
      prompts.
      resources.
      find { |item| Array(item.data.clusters).map(&:downcase)
              .intersection(Array(clusters).map(&:downcase)) }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end