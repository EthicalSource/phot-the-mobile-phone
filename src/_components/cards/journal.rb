require 'pry'
class Cards::Journal < Bridgetown::Component
  def initialize(post:)
    @highlight = post.highlight_summary
    @journal = post.data
    @link = post.relative_url
    @byline = source
  end

  def source
    return "Anonymous" if @journal.source.nil?
    return @journal.source if @journal.location.empty?
    "#{@journal.source}, #{@journal.location}"
  end
end