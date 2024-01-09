class Journal < Bridgetown::Model::Base
  def resources_to_explore
    six_random_journals.
      compact
  end

  private

  def six_random_journals
    other_journals.
      sample(6)
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