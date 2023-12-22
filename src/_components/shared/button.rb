class Shared::Button < Bridgetown::Component
  def initialize(text:, href:, type: :primary)
    @text, @href, @type = text, href, type
    case @type
    when :secondary
      @classname = "text-medium-grey border border-medium-grey text-meta rounded-sm px-[15px] py-3 hover:text-lime-green hover:border-lime-green hover:underline hover:opacity-70 active:no-underline block min-h-[50px] min-w-[190px] w-fit text-center"
    when :tertiary
      @classname = "text-lime-green border border-lime-green text-meta rounded-sm px-5 hover:text-lime-green hover:border-lime-green hover:underline hover:opacity-70 active:no-underline block min-h-[50px] min-w-[190px] w-fit text-center py-3"
    else
      @classname = "bg-lime-green text-black text-meta rounded-sm px-[15px] py-3 hover:underline hover:opacity-70 active:no-underline  block min-h-[50px] min-w-[190px] w-fit text-center"
    end
  end
end
