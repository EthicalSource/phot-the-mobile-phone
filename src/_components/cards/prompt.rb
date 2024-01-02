require 'pry'
class Cards::Prompt < Bridgetown::Component
  def initialize(post:)
    @prompt = post.data
    @link = post.relative_url
  end
end