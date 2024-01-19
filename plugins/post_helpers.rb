require 'pry'
module PostHelpers
  def self.prompts_by_collection(posts:, value:, prefer_featured: false, count: 1)
    return [] if value.nil?

    select_posts = posts.select do |item|
      Array(item.data.clusters).map(&:downcase).
        intersection(Array(value).map(&:downcase)).any?
    end
    featured_posts = if prefer_featured
      select_posts.select { |post| post.data.feature == true }
    end
    [featured_posts, select_posts].flatten.compact.take(count)
  end

  def self.events_by_collection(posts:, value:, prefer_featured: false, count: 5)
    return [] if value.nil?

    select_posts = posts.select do |item|
      Array(item.data.clusters).map(&:downcase).
        intersection(Array(value).map(&:downcase)).any?
    end

    featured_posts = if prefer_featured
      select_posts.select { |post| post.data.feature == true }
    else
      []
    end.sort_by! { |post| post.data.start_date.year.to_int }

    select_posts.sort_by! { |post| post.data.start_date.year.to_int }

    [featured_posts, select_posts].flatten.compact
  end

  def self.ctas_by_collection(posts:, value:, prefer_featured: false, count: 1)
    return [] if value.nil?

    select_posts = posts.select do |item|
      Array(item.data.clusters).map(&:downcase).
        intersection(Array(value).map(&:downcase)).any?
    end
    featured_posts = if prefer_featured
      select_posts.select { |post| post.data.feature == true }
    end
    [featured_posts, select_posts].flatten.compact.take(count)
  end

  def self.journals_by_collection(posts:, value:, prefer_featured: false, count: 1)
    return [] if value.nil?
    select_posts = posts.select do |item|
      Array(item.data.clusters).map(&:downcase).
        intersection(Array(value).map(&:downcase)).any?
    end
    featured_posts = if prefer_featured
      select_posts.select { |post| post.data.feature == true }
    end
    [featured_posts, select_posts].flatten.compact.take(count)
  end

  def self.featured_collections(posts:, count: 11)
    posts.select do |collection|
      collection.data.feature
    end.take(count)
  end

  def self.explorable_collections(posts:, value: nil, count: 11)
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