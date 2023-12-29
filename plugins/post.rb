require 'sanitize'

module PostResourceExtension
  module RubyResource
    def content_summary(length: 300)
      # We sanitize the content here in order to remove the HTML so things render plainly
      # however, Sanitize does not handle HTML entities
      # https://github.com/rgrove/sanitize/issues/193
      sanitize_content(content)[0, length].split[0...-1].join(' ').gsub(/&nbsp;/, ' ')
    end

    def highlight_summary(length: 85)
      sanitize_content(data.highlight)[0, length].split[0...-1].join(' ').gsub(/&nbsp;/, ' ')
    end

    def sanitize_content(content_body)
      Sanitize.fragment(content_body)
    end
  end
end

class Post < Bridgetown::Model::Base
end

Bridgetown::Resource.register_extension PostResourceExtension
Bridgetown::RubyTemplateView::Helpers.include PostHelpers
