class Cards::Event < Bridgetown::Component
  def initialize(post:)
    @content = post.content_summary(length: 125)
    @event = post.data
    @link = post.relative_url
  end
end