require 'pry'
module PostHelpers
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

  def self.ctas_by_collection(posts:, value:, count: 1)
    return [] if value.nil?

    posts.select do |cta|
      Bridgetown::Utils.slugify(cta.data.clusters) == Bridgetown::Utils.slugify(value)
    end.take(count)
  end

  def self.journals_by_collection(posts:, value:, count: 1)
    return [] if value.nil?

    posts.select do |journal|
      Bridgetown::Utils.slugify(journal.data.clusters) == Bridgetown::Utils.slugify(value)
    end.take(count)
  end

  def self.featured_collections(posts:, count: 11)
    posts.select do |collection|
      collection.data.feature
    end.take(count)
  end

  def self.explorable_collections(posts:, value:, count: 11)
    return [] if value.nil?

    posts.reject do |collection|
      collection.data.explore == false ||
        Bridgetown::Utils.slugify(collection.data.title) == Bridgetown::Utils.slugify(value)
    end.take(count)
  end

  def self.suggested_by(posts:, facet:, value:, count: 2)
    return [] if value.nil?
    posts.select { |post| post.data.send(facet).map(&:downcase).include? value.downcase }.take count
  end
end

Bridgetown::RubyTemplateView::Helpers.include PostHelpers