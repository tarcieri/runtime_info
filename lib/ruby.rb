require 'rbconfig'

# Interfaces to various Ruby virtual machine and platform specifics
module Ruby
  module_function # a convoluted shortcut to avoid any << crap or self. shit
  
  # A platform identifier containing CPU and OS information
  def platform; RUBY_PLATFORM; end
  
  # Host CPU architecture
  def arch; Config::CONFIG['host_cpu']; end
  alias_method :cpu_architecture, :arch
  
  # Ruby virtual machine in use
  def engine
    return RUBY_ENGINE if defined? RUBY_ENGINE
    'ruby'
  end
end