class Cards::CallToAction < Bridgetown::Component
  def initialize(post:)
    @content = post.summary_summary(length: 175)
    @cta     = post.data
    @link    = post.relative_url
  end
end