class Event::Thumbnail < Bridgetown::Component
  def initialize(event:)
    @event = event
    @image = event.data.media&.thumbnail
    @alt = event.data.media&.alt
  end
end