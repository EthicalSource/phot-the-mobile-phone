class Shared::Credit < Bridgetown::Component
  def initialize(label:, text:, href:)
    @label, @text, @href = label, text, href
    @label = @label.nil? ? "" : "#{label}: "
  end
end
