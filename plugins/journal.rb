require 'pry'
class Journal < Bridgetown::Model::Base
  def resources_to_explore
    five_random_journals.
      push(cta_resource).
      compact
  end

  private

  def five_random_journals
    other_journals.
      sample(5)
  end

  def cta_resource
    site_collections.
      ctas.
      resources.
      find { |cta| cta.data.clusters == clusters }
  end

  def other_journals
    site_collections.
      journals.
      resources.
      reject { |journal| journal.data.title == title }
  end

  def site_collections
    Bridgetown::Current.site.collections
  end
end