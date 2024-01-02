class Cards::TakeAction < Bridgetown::Component
  def initialize(post:)
    @content = post.content_summary(length: 150)
    @event = post.data
    @link = post.relative_url
  end
end