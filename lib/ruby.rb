require 'rbconfig'

# Interfaces to various platform specifics
module Ruby
  module_function # a convoluted shortcut to avoid any << crap or self. shit
  
  # Aliases to some silly globals
  def platform; RUBY_PLATFORM; end
  
  def engine
    return RUBY_ENGINE if defined? RUBY_ENGINE
    'ruby'
  end
end