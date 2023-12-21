class Shared::Palette < Bridgetown::Component
  def initialize(name:, hexcode:, classname:)
    @name, @hexcode, @classname = name, hexcode, classname
    if @hexcode == "#FFFFFF"
      @border = "border-2 border-medium-gray"
    else
      @border = "border-0"
    end
  end
end
  