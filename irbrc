require 'rubygems'
require 'pp'
require 'irb/completion'

def pbcopy(data)
  File.popen('pbcopy', 'w') { |p| p << data.to_s }
  $?.success?
end

# Stolen from Chris Toomey's dotfiles:
# http://github.com/christoomey/dotfiles
PERSONAL_ANSI = {}
PERSONAL_ANSI[:RESET]     = "\e[0m"
PERSONAL_ANSI[:BOLD]      = "\e[1m"
PERSONAL_ANSI[:UNDERLINE] = "\e[4m"
PERSONAL_ANSI[:LGRAY]     = "\e[0;37m"
PERSONAL_ANSI[:GRAY]      = "\e[0;90m"
PERSONAL_ANSI[:RED]       = "\e[31m"
PERSONAL_ANSI[:GREEN]     = "\e[32m"
PERSONAL_ANSI[:YELLOW]    = "\e[33m"
PERSONAL_ANSI[:BLUE]      = "\e[34m"
PERSONAL_ANSI[:MAGENTA]   = "\e[35m"
PERSONAL_ANSI[:CYAN]      = "\e[36m"
PERSONAL_ANSI[:WHITE]     = "\e[37m"

# Loading extensions of the console. This is wrapped
# because some might not be included in your Gemfile
# and errors will be raised
def extend_console(name, care = true, required = true)
  if care
    require name if required
    yield if block_given?
    $console_extensions << "#{PERSONAL_ANSI[:GREEN]}#{name}#{PERSONAL_ANSI[:RESET]}"
  else
    $console_extensions << "#{PERSONAL_ANSI[:GRAY]}#{name}#{PERSONAL_ANSI[:RESET]}"
  end
  rescue LoadError
  $console_extensions << "#{PERSONAL_ANSI[:RED]}#{name}#{PERSONAL_ANSI[:RESET]}"
end
$console_extensions = []

# Wirble is a gem for colorizing irb output and hist
extend_console 'wirble' do
  Wirble.init
  Wirble.colorize
end

# Fire up vim subsession, then eval buffer content on save-quit
extend_console 'interactive_editor'

# Awesome print for pretty colorful indented object printing
extend_console 'awesome_print'

def formatted_env
  if ENV["COMMONLIT_NAMESPACE"].present?
    "#{ENV['COMMONLIT_NAMESPACE'].upcase} - #{ENV['PORTER_POD_IMAGE_TAG']}"
  elsif ENV["DEVELOPMENT_DATABASE_URL"].present?
    "dev REMOTE DB"
  else
    Rails.env
  end
end

def application_name
  Rails.application.class.module_parent.name
end

def app_name
  File.basename(Rails.root)
end

def db_endpoint
  ApplicationRecord.connection_db_config.host.to_s.split(".").first || "unknown"
end

def rails_environment
  Rails.env
end

# Just for Rails...
if defined? Rails
  prompt = "[#{app_name}][#{formatted_env}][DB: #{db_endpoint}] %m:%i"

  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] ||= {
    :PROMPT_I => "#{prompt}> ",
    :PROMPT_S => "#{prompt}* ",
    :PROMPT_C => "#{prompt}? ",
    :RETURN   => "  => %s\n\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS
end

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
