class Event::Thumbnail < Bridgetown::Component
  def initialize(event:)
    @event = event
    @image = event.data.homepage_thumbnail&.src || event.data.media&.thumbnail
    @alt = event.data.homepage_thumbnail&.alt
  end

  def image(event)
    if event.data.homepage_thumbnail&.src.nil? ||
        event.data.homepage_thumbnail&.src.blank?
      event.data.media&.thumbnail
    else
      event.data.homepage_thumbnail&.src
    end
  end
end