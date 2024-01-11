class Shared::Credit < Bridgetown::Component
  def initialize(label: "", credit: "", href: "")
    @credit, @href = credit, href
    @link_missing = link_missing?
    @label = label.empty? ? "" : "#{label}: "
  end

  def render?
    return false if @label.empty?
    return false if @credit.nil? || @credit.empty?
    true
  end

  def link_missing?
    @href.nil? || @href.empty?
  end
end
