class Prompt::TypeForm < Bridgetown::Component
  def initialize(prompt:)
    @prompt = prompt.data
    @typeform_id = @prompt.typeform_id || default_typeform_id
  end

  def default_typeform_id
    "01HKTJCTQPX4VF8DS1YADRG11R"
  end
end