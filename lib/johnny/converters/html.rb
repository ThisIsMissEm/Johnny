require "erb"

module Johnny
  class Html < Converter
    def render(data)
      ERB.new(@template).binding({:content => data})
    end
  end
end