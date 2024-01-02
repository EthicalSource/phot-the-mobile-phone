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

  def self.prompts_by_collection(posts:, value:, count: 1)
    return [] if value.nil?

    posts.select do |prompt|
      Bridgetown::Utils.slugify(prompt.data.clusters) == Bridgetown::Utils.slugify(value)
    end
  end

  def self.events_by_collection(posts:, value:, count: 5)
    return [] if value.nil?
  
    posts.select do |event|
      Bridgetown::Utils.slugify(event.data.clusters) == Bridgetown::Utils.slugify(value)
    end
  end

  def self.journals_by_collection(posts:, value:, count: 1)
    return [] if value.nil?

    posts.select do |journal|
      Bridgetown::Utils.slugify(journal.data.clusters) == Bridgetown::Utils.slugify(value)
    end.take(count)
  end

  def self.other_collections(posts:, value:, count: 11)
    return [] if value.nil?

    posts.reject do |collection|
      Bridgetown::Utils.slugify(collection.data.title) == Bridgetown::Utils.slugify(value)
    end.take(count)
  end

  def self.suggested_by(posts:, facet:, value:, count: 2)
    return [] if value.nil?
    posts.select { |post| post.data.send(facet).map(&:downcase).include? value.downcase }.take count
  end
end

Bridgetown::RubyTemplateView::Helpers.include PostHelpers