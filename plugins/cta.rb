class Cta < Bridgetown::Model::Base
  def resources_to_explore
    other_ctas.
      insert(2,journal_resource).
      insert(4,prompt_resource).
      compact
  end

  private

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

  def prompt_resource
    site_collections.
      prompts.
      resources.
      find { |prompt| prompt.data.clusters.downcase == clusters.downcase }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end