require 'pry'
class Journal < Bridgetown::Model::Base
  def resources_to_explore
    output = other_journals
    output = output.insert(2,prompt_resource) if prompt_resource
    output = output.insert(4,cta_resource) if cta_resource
    output.compact
  end

  private

  def cta_resource
    site_collections.
      ctas.
      resources.
      find { |cta| cta.data.clusters.downcase == clusters.downcase }
  end

  def prompt_resource
    site_collections.
      prompts.
      resources.
      find { |prompt| prompt.data.clusters.downcase == clusters.downcase }
  end

  def other_journals
    site_collections.
      journals.
      resources.
      reject { |journal| journal.data.title.downcase == title.downcase }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end