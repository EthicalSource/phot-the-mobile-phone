class Shared::Event < Bridgetown::Component
  def initialize(event:, title:, contents:, collection:, cluster:, align:)
    @event, @title, @contents, @collection, @cluster, @align = text = event, title, collection, contents, cluster, align

    case @align
    when :right
      @classname = 'sm:text-right'
    when :left
      @classname = 'sm:text-left'
    end
  end
end