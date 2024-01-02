class Shared::Credit < Bridgetown::Component
  def initialize(label: "", credit: "", href: "")
    @credit, @href = credit, href
    @label = label.empty? ? "" : "#{label}: "
  end

  def render?
    return false if @label.empty?
    return false if @credit.nil? || @credit.empty?
    true
  end
end
