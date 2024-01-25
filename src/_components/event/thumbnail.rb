class Event::Thumbnail < Bridgetown::Component
  def initialize(event:)
    @event = event
    @image = image(event)
    @alt = event.data.homepage_thumbnail&.alt
  end

  def image(event)
    photo = event.data.homepage_thumbnail
    if photo && !photo.src&.blank?
      event.data.homepage_thumbnail&.src
    else
      event.data.media&.thumbnail
    end
  end
end