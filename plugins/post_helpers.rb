require 'pry'
module PostHelpers
  def self.suggested_posts_by_tags(post:, posts:, count_per_facet: 5)
    results = []
    filtered_posts = posts.reject { |p| post.title === p.data.title }.shuffle
    
    tags = post.tags.reject(&:empty?)

    tags.each do |tag|
      results << suggested_by(posts: filtered_posts,
                    facet: "tags",
                    value: tag,
                    count: count_per_facet)
    end
    
    results.flatten
  end

  def self.suggested_by(posts:, facet:, value:, count: 2)
    return [] if value.nil?
    posts.select { |post| post.data.send(facet).map(&:downcase).include? value.downcase }.take count
  end
end

Bridgetown::RubyTemplateView::Helpers.include PostHelpers