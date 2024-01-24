class Event::Thumbnail < Bridgetown::Component
  def initialize(event:)
    @event = event
    @image = event.data.homepage_thumbnail&.image
    @alt = event.data.homepage_thumbnail&.alt
  end
end