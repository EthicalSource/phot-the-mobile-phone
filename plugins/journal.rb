class Journal < Bridgetown::Model::Base
  def resources_to_explore
    other_journals.
      push(prompt_resource).
      push(cta_resource).
      compact
  end

  private

  def cta_resource
    site_collections.
      ctas.
      resources.
      find { |cta| Array(cta.data.clusters).flatten.
              map(&:downcase).include?(clusters.downcase) }
  end

  def prompt_resource
    site_collections.
      prompts.
      resources.
      find { |prompt| Array(prompt.data.clusters).flatten.
              map(&:downcase).include?(clusters.downcase) }
  end

  def other_journals
    site_collections.
      journals.
      resources.
      reject { |journal| Array(journal.data.clusters).flatten.
                map(&:downcase).include?(clusters.downcase) }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end