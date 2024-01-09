class Cards::ExploreMore::Base < Bridgetown::Component
  def initialize(post)
    @card_type = post.collection.label.singularize
    @post      = post
    @link      = post.relative_url
  end

  def card_body
    case @post.data.class_name
    when "Cta"
      Cards::ExploreMore::Cta.new(@post)
    when "Event"
      Cards::ExploreMore::Event.new(@post)
    when "Journal"
      Cards::ExploreMore::Journal.new(@post)
    end
  end
end