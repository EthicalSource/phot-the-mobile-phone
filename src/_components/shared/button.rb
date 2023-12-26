class Shared::Button < Bridgetown::Component
  def initialize(text:, href:, type: :primary)
    @text, @href, @type = text, href, type
    case @type
    when :secondary
      @classname = "button secondary"
    when :tertiary
      @classname = "button tertiary"
    else
      @classname = "button primary"
    end
  end
end
