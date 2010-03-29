require "rdiscount"

module Johnny
  class Markdown < Converter
    def render(data)
      RDiscount.new(data).to_html
    end
  end
end