class Shared::Journal < Bridgetown::Component 
  def initialize(journal:, cluster:)
    @journal, @cluster = journal, cluster
  end
end