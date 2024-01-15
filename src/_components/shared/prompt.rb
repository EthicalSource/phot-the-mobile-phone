class Shared::Prompt < Bridgetown::Component 
  def initialize(prompt:)
    @prompt = prompt
  end

  def render?
    !@prompt.nil?
  end
end