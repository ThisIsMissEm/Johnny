$:.unshift File.expand_path(File.join(File.dirname(__FILE__)))

require "rubygems"
require "fileutils"
require "yaml"

module Johnny
  autoload :Config,    "johnny/config"
  autoload :Converter, "johnny/converter"
  autoload :Watcher,   "johnny/watcher"
  autoload :Rack,      "johnny/rack"
  autoload :Command,   "johnny/command"
  
  class << self
    attr_accessor :version
    attr_accessor :config
    
    def version
      @version ||= File.read(File.join(File.dirname(__FILE__), "..","VERSION")).strip!
    end
        
    def dir
      File.expand_path(File.join(File.dirname(__FILE__)))
    end
  end
end