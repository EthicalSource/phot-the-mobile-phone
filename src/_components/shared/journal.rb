class Shared::Journal < Bridgetown::Component 
  def initialize(journal:, cluster:)
    @journal, @cluster = journal, cluster
  end

  def render?
    !@journal.nil?
  end
end