module Johnny
  class Converter
    autoload :Markdown, "johnny/converters/markdown"
    autoload :Html, "johnny/converters/html"
    
    def initialize(template)
      @template = File.read(File.join(Johnny.config["template_path"], template))
    end
    
    def convert(format, data)
      @output = self[:html].render(self[format].render(data))
      puts @output
    end
  end
end