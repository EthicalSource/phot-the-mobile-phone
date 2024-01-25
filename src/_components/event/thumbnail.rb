class Event::Thumbnail < Bridgetown::Component
  def initialize(event:)
    @event = event
    @image = event.data.homepage_thumbnail&.image || event.data.media&.thumbnail
    @alt = event.data.homepage_thumbnail&.alt
  end
end