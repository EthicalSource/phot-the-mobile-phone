module PageHelpers
  def self.pages_in_footer(pages:)
    pages.select { |page| page.data.in_footer }.
      sort_by { |page| page.data.order }
  end
end

Bridgetown::RubyTemplateView::Helpers.include PageHelpers