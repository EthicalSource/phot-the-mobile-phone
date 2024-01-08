class Shared::Event < Bridgetown::Component
  def initialize(event:, cluster:, align: :right)
    @event, @cluster, @align  = event, cluster, align
    case @align
    when :right
      @classname = 'sm:text-right'
    when :left
      @classname = 'sm:text-left'
    end
  end

  def render?
    return false if @event.nil?
    return false if @cluster.nil?
    true
  end
end

