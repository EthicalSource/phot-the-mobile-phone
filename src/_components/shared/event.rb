class Shared::Event < Bridgetown::Component
  def initialize(event:, align:, breakall:, cluster:)
    @event, @align, @cluster, @breakall = event, align, cluster, breakall
    case @align
    when :right
      @classname = 'sm:text-right'
    when :left
      @classname = 'sm:text-left'
    end

    case @breakall
    when :true
      @breakAllClass = 'break-all'
    end
  end
end