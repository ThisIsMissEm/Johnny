module Johnny
  class Config < Hash
    attr_accessor :source, :destination, :template_path, :embed_stylesheet
    
    def initialize(config={})
      config_file = File.join(Dir.pwd, "config.yaml")
      has_config_file = false
      
      begin
        self.merge!(YAML.load_file(config_file))
        $stdout.puts "Using Configuration from: #{config_file}"
        has_config_file = true
      rescue
      end
      
      if config.empty? && !has_config_file
        $stderr.puts "WARNING: Could not read configuration from file, using defaults."
        $stderr.puts "Defaults: "
        $stderr.puts "  source:           #{self.source}"
        $stderr.puts "  destination:      #{self.destination}"
        $stderr.puts "  embed_stylesheet: true"
        $stderr.puts "  template_path:    GEM/templates"
      else
        self.merge! config
      end
      
      self[:source] ||= File.expand_path(Dir.pwd)
      self[:destination] ||= File.expand_path(File.join(self[:source], "html"))
      self[:template_path] ||= File.expand_path(File.join(Johnny.dir, "..", "templates"))
      self[:embed_stylesheet] ||= true
    end
    
    def destination=(path)
      unless File.exists?(path) && File.directory?(path)
        $stderr.puts "WARNING: Destination directory not found, auto creating."
        FileUtils.mkdir_p(path)
      end
      @destination = path
    end
  end
end