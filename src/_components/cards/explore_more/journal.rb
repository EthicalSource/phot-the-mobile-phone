class Cards::ExploreMore::Journal < Cards::ExploreMore::Base
  def source
    return "Anonymous" if journal.source.nil?
    return journal.source if journal.location.empty?
    "– #{journal.source}, #{journal.location}"
  end

  private

  def journal
    @post.data
  end
end