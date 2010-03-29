require 'rubygems'
require 'rake'
 
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "johnny"
    gem.summary = %Q{Watches directories and converts markdown documents to other formats}
    gem.description = %Q{Watches directories and converts markdown documents to other formats through erb templates}
    gem.email = "micheil@brandedcode.com"
    gem.homepage = "http://github.com/miksago/johnny"
    gem.author = "Micheil Smith"
    gem.add_dependency "fssm"
    gem.add_dependency "rdiscount"
    gem.files = []
    gem.files << "README.md"
    gem.files << "VERSION"
    gem.files += Dir.glob("bin/*")
    gem.files += Dir.glob("lib/*")
    gem.files += Dir.glob("templates/*")
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end