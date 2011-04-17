require 'rbconfig'

# DON'T REQUIRE RUBYGEMS!!! Actually I'm using a feature of Rubygems here,
# so unless you're keen on reimplementing Ruby.path yourself and sending
# me a pull request, please don't complain.
require 'rubygems'

# Interfaces to various Ruby virtual machine and platform specifics
module Runtime
  module_function # a convoluted shortcut to avoid any << crap or self. shit
  
  # A platform identifier containing CPU and OS information
  def platform; RUBY_PLATFORM; end
  
  # Host CPU architecture
  def arch; Config::CONFIG['host_cpu']; end
  alias_method :cpu_architecture, :arch
  
  # Host OS
  def os; Config::CONFIG['host_os']; end
  
  # Ruby virtual machine in use
  def engine
    return RUBY_ENGINE if defined? RUBY_ENGINE
    'ruby'
  end
  
  # Path to the Ruby interpreter currently in use
  def path; Gem.ruby; end
end