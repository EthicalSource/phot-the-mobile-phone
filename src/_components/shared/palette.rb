class Shared::Palette < Bridgetown::Component
  def initialize(name:, hexcode:, classname:)
    @name, @hexcode, @classname = name, hexcode, classname
  end
end
  