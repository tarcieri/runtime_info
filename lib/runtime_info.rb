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
  def cpu_architecture; arch; end
  
  # Number of physical CPU cores
  def ncpus
    case os
    when 'darwin'
      Integer(`hwprefs cpu_count`)
    when 'linux'
      cores = File.read("/proc/cpuinfo").scan(/core id\s+: \d+/).uniq.size
      cores > 0 ? cores : 1
    else raise "don't know how to determine CPU count on #{os}"
    end
  end
  def cpu_count; ncpus; end
  
  # Host OS
  def os
    Config::CONFIG['host_os'][/^[A-Za-z]+/]
  end
  
  # Ruby virtual machine in use
  def engine
    return RUBY_ENGINE if defined? RUBY_ENGINE
    'ruby'
  end
  
  # Version of the Ruby virtual machine in use
  def version
    case engine
    when 'ruby'  then RUBY_VERSION
    when 'jruby' then JRUBY_VERSION
    when 'rbx'   then Rubinius::VERSION
    else raise "don't know how to obtain version for #{engine}"
    end
  end
  
  # Path to the Ruby interpreter currently in use
  def path; Gem.ruby; end
end