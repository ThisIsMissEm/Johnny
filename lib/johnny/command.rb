require "optparse"

module Johnny
  class Command
    attr_accessor :command
    attr_accessor :options
    attr_accessor :arguments
    
    def initialize(argv)
      @commands = %w[init update watch]
      @argv = argv
      parse!
    end
    
    def parser
      @parser ||= ::OptionParser.new do |opts|
        opts.banner = "Usage: johnny #{@commands.join('|')} [options]"
        opts.separator " "
        opts.separator "Note: when using the 'init' command, passing --template option will create"
        opts.separator "a directory in the source path containing the default templates."
        
        opts.separator " "
        opts.separator "Common Options:"
        
        opts.on("-s", "--source PATH", "Set the input source directory") {|path| @options[:source] = path}
        opts.on("-d", "--destination PATH", "Set the output directory") {|path| @options[:destination] = path}
        opts.on("-t", "--template PATH", "Set the template source directory") {|path| @options[:template_path] = path}
        
        opts.separator " "
        
        opts.on_tail("-h", "--help", "Show this message") {puts opts; exit}
        opts.on_tail("-v", "--version", "Show the version") {puts Johnny.version; exit}
      end
    end
    
    def parse!
      args = parser.parse(@argv)
      @command = args.pop
      @arguments = args
    rescue OptionParser::ParseError => e
      $stderr.puts "Error: Unknown Option: #{e.to_s.split(": ")[1]}"
      puts "--"
      puts @parser
      exit 1
    end
    
    def run!
      if @commands.include?(@command)
        self.send(@command, *@arguments)
      elsif @command.nil?
        $stderr.puts "Error: Command required"
        puts "--"
        puts @parser
        exit 1  
      else
        abort "Unknown command: #{@command}. Use one of #{@commands.join(', ')}"
      end
    end
    
    def init
      puts "stub"
      puts @arguments.join(", ")
      puts @command
    end
    
    def update
      puts "stub"
    end
    
    def watch
      puts "stub"
    end
  end
end