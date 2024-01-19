class Shared::DateLocation < Bridgetown::Component
  def initialize(year: nil, location: nil)
    @year, @location = year, location
    @formatted_date_location = formatted_date_location
  end

  def formatted_date_location
    return nil if @year.nil? && @location.nil?
    return @year if @location.nil?
    return @location if @year.nil?
    "#{@year}, #{@location}"
  end

  def render?
    @year || @location
  end
end
