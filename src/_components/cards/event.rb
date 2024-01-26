class Cards::Event < Bridgetown::Component
  def initialize(post:)
    @content = post.summary_summary(length: 125)
    @event = post.data
    @link = post.relative_url

    photo = post.data.cluster_thumbnail
    if photo && !photo.src&.blank?
      @image = photo.src
      @alt = photo.alt
    else
      @image = post.data.media&.thumbnail
      @alt = post.data.media&.alt
    end
  end
end