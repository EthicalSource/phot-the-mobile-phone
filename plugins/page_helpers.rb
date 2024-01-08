module PageHelpers
  def self.pages_in_footer(pages:)
    pages.select { |page| page.data.in_footer }
  end
end

Bridgetown::RubyTemplateView::Helpers.include PageHelpers