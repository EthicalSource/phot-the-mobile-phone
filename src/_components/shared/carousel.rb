class Shared::Carousel < Bridgetown::Component
  def initialize(header_text: "Explore More")
    @header_text = header_text
  end
end