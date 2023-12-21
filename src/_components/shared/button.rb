class Shared::Button < Bridgetown::Component
  def initialize(text:, href:, type: :primary)
    @text, @href, @type = text, href, type
    case @type
    when :secondary
      @classname = "text-medium-grey border border-medium-grey text-base rounded-[2px] px-[15px] py-3 uppercase hover:text-lime-green hover:border-lime-green hover:underline hover:opacity-70 active:no-underline block min-h-[50px] min-w-[190px] w-fit text-center"
    when :tertiary
      @classname = "text-lime-green border border-lime-green text-base rounded-[2px] px-5 uppercase hover:text-lime-green hover:border-lime-green hover:underline hover:opacity-70 active:no-underline block min-h-[50px] min-w-[190px] w-fit text-center py-3"
    else
      @classname = "bg-lime-green text-base rounded-[2px] px-[15px] py-3 uppercase hover:underline hover:opacity-70 active:no-underline  block min-h-[50px] min-w-[190px] w-fit text-center"
    end
  end
end
